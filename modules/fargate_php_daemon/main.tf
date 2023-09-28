/**
 * # Terraform AWS New Relic ECS Fargate PHP Daemon Module
 *
 * This module creates an ECS Service running the New Relic PHP Daemon as a container. This is recommended
 * for PHP applications running on Fargate. See:
 *
 * https://docs.newrelic.com/docs/apm/agents/php-agent/advanced-installation/docker-other-container-environments-install-php-agent/
 */

# Used to get the current VPC as default from the passed subnet
data "aws_subnet" "first" {
  id = var.ecs_subnets[0]
}

## ECS CLUSTER
module "ecs_cluster" {
  count = var.enable_ecs_cluster ? 1 : 0

  source  = "geekcell/ecs-cluster/aws"
  version = ">= 1.0.0, < 2.0.0"

  name = var.ecs_cluster_name
  tags = var.tags
}

## ECS SERVICE
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
  name = coalesce(var.ecs_service_name, var.task_definition_name)

  launch_type            = "FARGATE"
  task_definition        = module.task_definition.arn
  cluster                = var.ecs_cluster_name
  desired_count          = var.ecs_desired_count
  enable_execute_command = var.enable_execute_command

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets = var.ecs_subnets
    security_groups = concat(var.ecs_security_groups, var.enable_security_group ? [
      module.security_group[0].security_group_id
    ] : [])
    assign_public_ip = false
  }

  dynamic "service_registries" {
    for_each = var.enable_ecs_service_discovery ? [true] : []

    content {
      registry_arn = aws_service_discovery_service.main[0].arn
    }
  }

  propagate_tags = "SERVICE"
  tags           = var.tags
}

## SECURITY GROUP
module "security_group" {
  count = var.enable_security_group ? 1 : 0

  source  = "geekcell/security-group/aws"
  version = ">= 1.0.0, < 2.0.0"

  name   = coalesce(var.security_group_name, "${var.task_definition_name}-ecs")
  vpc_id = coalesce(var.security_group_vpc, data.aws_subnet.first.vpc_id)

  ingress_rules = var.security_group_ingress_rules
  egress_rules  = var.security_group_egress_rules

  tags = var.tags
}

## SERVICE DISCOVERY
resource "aws_service_discovery_private_dns_namespace" "main" {
  count = var.enable_ecs_service_discovery && var.service_discovery_namespace_id == null ? 1 : 0

  name = var.service_discovery_private_dns_namespace_name
  vpc  = coalesce(var.service_discovery_private_dns_namespace_vpc, data.aws_subnet.first.vpc_id)

  tags = var.tags
}

resource "aws_service_discovery_service" "main" {
  count = var.enable_ecs_service_discovery ? 1 : 0

  name = var.service_discovery_name

  dns_config {
    namespace_id   = coalesce(var.service_discovery_namespace_id, aws_service_discovery_private_dns_namespace.main[0].id)
    routing_policy = "MULTIVALUE"

    dns_records {
      ttl  = 10
      type = "A"
    }
  }

  tags = var.tags
}
