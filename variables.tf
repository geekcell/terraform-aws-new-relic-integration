## NAMING
variable "name" {
  default     = "new-relic"
  description = "Name or prefix for the resources."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tags to add to the resources."
  type        = map(any)
}

## INTEGRATIONS
variable "aws_account_id" {
  default     = null
  description = "AWS Account ID to integrate into New Relic. Will use current AWS Account if left blank."
  type        = string
}

variable "new_relic_external_id" {
  default     = "754728514883"
  description = "The New Relic side AWS Account ID."
  type        = string
}

variable "new_relic_cloudwatch_metrics_endpoint" {
  default     = "https://aws-api.eu01.nr-data.net/cloudwatch-metrics/v1"
  description = "New Relic Cloudwatch Endpoint for either EU or US."
  type        = string
}

variable "new_relic_firehose_endpoint" {
  default     = "https://aws-api.eu.newrelic.com/firehose/v1"
  description = "New Relic Firehose Endpoint for either EU or US."
  type        = string
}

variable "flow_logs_vpc_ids" {
  default     = []
  description = "List of VPC IDs to enable VPC Flow Logs for. If empty, VPC Flow Logs will not be enabled."
  type        = list(string)
}
