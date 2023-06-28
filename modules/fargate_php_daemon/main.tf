/**
 * # Terraform AWS New Relic ECS Fargate PHP Daemon Module
 *
 * This module creates an ECS Service running the New Relic PHP Daemon as a container. This is recommended
 * for PHP applications running on Fargate. See:
 *
 * https://docs.newrelic.com/docs/apm/agents/php-agent/advanced-installation/docker-other-container-environments-install-php-agent/
 */
module "container_definition" {
  source  = "geekcell/ecs-container-definition/aws"
  version = ">= 1.0.0, < 2.0.0"

  name  = var.container_name
  image = var.container_image
  port_mappings = [
    {
      host_port      = var.container_host_port
      container_port = var.container_port
      protocol       = "tcp"
    }
  ]
}

module "task_definition" {
  source  = "geekcell/ecs-task-definition/aws"
  version = ">= 1.0.0, < 2.0.0"

  name                  = var.task_definition_name
  container_definitions = [module.container_definition.hcl]

  cpu                    = var.task_definition_cpu
  memory                 = var.task_definition_memory
  enable_execute_command = var.enable_execute_command

  tags = var.tags
}

resource "aws_ecs_service" "main" {
  name = var.ecs_service_name

  launch_type            = "FARGATE"
  task_definition        = module.task_definition.arn
  cluster                = var.ecs_cluster_name
  desired_count          = var.ecs_desired_count
  enable_execute_command = var.enable_execute_command

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets          = var.ecs_subnets
    security_groups  = var.ecs_security_groups
    assign_public_ip = false
  }

  dynamic "service_registries" {
    for_each = var.enable_ecs_service_discovery ? [true] : []

    content {
      registry_arn = aws_service_discovery_service.main[0].arn
    }
  }

  tags = var.tags
}

resource "aws_service_discovery_service" "main" {
  count = var.enable_ecs_service_discovery ? 1 : 0

  name = var.service_discovery_name

  dns_config {
    namespace_id   = var.service_discovery_namespace_id
    routing_policy = "MULTIVALUE"

    dns_records {
      ttl  = 10
      type = "A"
    }
  }

  tags = var.tags
}
