## NAMING
variable "tags" {
  description = "Tags to add to the created resources."
  default     = {}
  type        = map(any)
}

## CONTAINER
variable "container_image" {
  description = "The image used to start the container."
  default     = "newrelic/php-daemon:10.7.0"
  type        = string
}

variable "container_name" {
  description = "The name of the container in the task definition."
  default     = "new-relic"
  type        = string
}

variable "container_host_port" {
  description = "The external port that the container can be connected to."
  default     = 31339
  type        = number
}

variable "container_port" {
  description = "The port that the container is listening on."
  default     = 31339
  type        = number
}

## TASK DEF
variable "task_definition_name" {
  description = "The name of the task definition."
  type        = string
}

variable "task_definition_cpu" {
  description = "The number of cpu units used by the task."
  default     = 256
  type        = number
}

variable "task_definition_memory" {
  description = "The amount of memory (in MiB) used by the task."
  default     = 512
  type        = number
}

variable "enable_execute_command" {
  description = "Enable execute command for the task."
  default     = true
  type        = bool
}

## ECS SERVICE
variable "ecs_cluster_name" {
  description = "The name of the ECS cluster to run the task in."
  type        = string
}

variable "ecs_subnets" {
  description = "A list of subnet IDs to launch the task in."
  type        = list(string)
}

variable "ecs_security_groups" {
  description = "A list of security group IDs to associate with the task."
  type        = list(string)
}

variable "ecs_service_name" {
  description = "The name of the ECS service."
  type        = string
}

variable "ecs_desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  default     = 1
  type        = number
}

## SERVICE DISCOVERY
variable "enable_ecs_service_discovery" {
  description = "Enable service discovery for the ECS service."
  default     = false
  type        = bool
}

variable "service_discovery_namespace_id" {
  description = "The ID of the namespace to use for service discovery. Required if enable_ecs_service_discovery is enabled."
  default     = null
  type        = string
}

variable "service_discovery_name" {
  description = "The service discovery name to use."
  default     = "nr-php-daemon"
  type        = string
}
