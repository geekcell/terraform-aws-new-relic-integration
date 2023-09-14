<!-- BEGIN_TF_DOCS -->
# Terraform AWS New Relic ECS Fargate PHP Daemon Module

This module creates an ECS Service running the New Relic PHP Daemon as a container. This is recommended
for PHP applications running on Fargate. See:

https://docs.newrelic.com/docs/apm/agents/php-agent/advanced-installation/docker-other-container-environments-install-php-agent/

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_host_port"></a> [container\_host\_port](#input\_container\_host\_port) | The external port that the container can be connected to. | `number` | `31339` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | The image used to start the container. | `string` | `"newrelic/php-daemon:10.7.0"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | The name of the container in the task definition. | `string` | `"new-relic"` | no |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port that the container is listening on. | `number` | `31339` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | The name of the ECS cluster to run the task in. | `string` | n/a | yes |
| <a name="input_ecs_desired_count"></a> [ecs\_desired\_count](#input\_ecs\_desired\_count) | The number of instances of the task definition to place and keep running. | `number` | `1` | no |
| <a name="input_ecs_security_groups"></a> [ecs\_security\_groups](#input\_ecs\_security\_groups) | A list of security group IDs to associate with the task. | `list(string)` | `[]` | no |
| <a name="input_ecs_service_name"></a> [ecs\_service\_name](#input\_ecs\_service\_name) | The name of the ECS service. Defaults to task\_definition\_name. | `string` | `null` | no |
| <a name="input_ecs_subnets"></a> [ecs\_subnets](#input\_ecs\_subnets) | A list of subnet IDs to launch the task in. | `list(string)` | n/a | yes |
| <a name="input_enable_ecs_cluster"></a> [enable\_ecs\_cluster](#input\_enable\_ecs\_cluster) | If enabled, will create an ECS Cluster with the given name. | `bool` | `false` | no |
| <a name="input_enable_ecs_service_discovery"></a> [enable\_ecs\_service\_discovery](#input\_enable\_ecs\_service\_discovery) | Enable service discovery for the ECS service. | `bool` | `false` | no |
| <a name="input_enable_execute_command"></a> [enable\_execute\_command](#input\_enable\_execute\_command) | Enable execute command for the task. | `bool` | `true` | no |
| <a name="input_enable_security_group"></a> [enable\_security\_group](#input\_enable\_security\_group) | Create and attach a default security group for the ECS service. | `bool` | `true` | no |
| <a name="input_security_group_egress_rules"></a> [security\_group\_egress\_rules](#input\_security\_group\_egress\_rules) | A list of egress rules to apply to the security group. | `list(any)` | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "Allow all outbound traffic.",<br>    "port": 0,<br>    "protocol": "-1"<br>  }<br>]</pre> | no |
| <a name="input_security_group_ingress_rules"></a> [security\_group\_ingress\_rules](#input\_security\_group\_ingress\_rules) | A list of ingress rules to apply to the security group. | `list(any)` | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "10.0.0.0/8"<br>    ],<br>    "description": "Allow NR Daemon traffic from VPC.",<br>    "port": 31339,<br>    "protocol": "tcp"<br>  }<br>]</pre> | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group. | `string` | `null` | no |
| <a name="input_security_group_vpc"></a> [security\_group\_vpc](#input\_security\_group\_vpc) | The VPC ID. If not provided, the first subnets VPC will be used. | `string` | `null` | no |
| <a name="input_service_discovery_name"></a> [service\_discovery\_name](#input\_service\_discovery\_name) | The service discovery name to use. | `string` | `"php-daemon"` | no |
| <a name="input_service_discovery_namespace_id"></a> [service\_discovery\_namespace\_id](#input\_service\_discovery\_namespace\_id) | The ID of the namespace to use for service discovery. | `string` | `null` | no |
| <a name="input_service_discovery_private_dns_namespace_name"></a> [service\_discovery\_private\_dns\_namespace\_name](#input\_service\_discovery\_private\_dns\_namespace\_name) | The name of the private DNS namespace to create. Required if enable\_ecs\_service\_discovery is enabled and service\_discovery\_namespace\_id is not provided. | `string` | `null` | no |
| <a name="input_service_discovery_private_dns_namespace_vpc"></a> [service\_discovery\_private\_dns\_namespace\_vpc](#input\_service\_discovery\_private\_dns\_namespace\_vpc) | The VPC ID to associate with the private DNS namespace. If not provided, the VPC of the first subnet in the list of subnets will be used. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the created resources. | `map(any)` | `{}` | no |
| <a name="input_task_definition_cpu"></a> [task\_definition\_cpu](#input\_task\_definition\_cpu) | The number of cpu units used by the task. | `number` | `256` | no |
| <a name="input_task_definition_memory"></a> [task\_definition\_memory](#input\_task\_definition\_memory) | The amount of memory (in MiB) used by the task. | `number` | `512` | no |
| <a name="input_task_definition_name"></a> [task\_definition\_name](#input\_task\_definition\_name) | The name of the task definition. | `string` | n/a | yes |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

- resource.aws_ecs_service.main (modules/fargate_php_daemon/main.tf#56)
- resource.aws_service_discovery_private_dns_namespace.main (modules/fargate_php_daemon/main.tf#105)
- resource.aws_service_discovery_service.main (modules/fargate_php_daemon/main.tf#114)
- data source.aws_subnet.first (modules/fargate_php_daemon/main.tf#11)
<!-- END_TF_DOCS -->
