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
variable "new_relic_account_id" {
  description = "Unique identifier for New Relic account."
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

variable "integration_role_name_prefix" {
  description = "Whether to use a prefix for the Integration Role name."
  default     = false
  type        = bool
}

variable "ingeration_role_name" {
  description = "Name of the Integration Role for New Relic."
  default     = null
  type        = string
}

variable "metric_stream_role_name" {
  description = "Name of the Metric Stream Role to use for Cloudwatch Metrics."
  default     = null
  type        = string
}

variable "metric_stream_role_name_prefix" {
  description = "Whether to use a prefix for the Metric Stream Role name."
  default     = false
  type        = bool
}

variable "cloudwatch_metric_stream_name" {
  description = "Name of the Cloudwatch Metric Stream."
  default     = null
  type        = string
}

variable "firehose_role_name_prefix" {
  description = "Whether to use a prefix for the Firehose Role name."
  default     = false
  type        = bool
}

variable "firehose_role_name" {
  description = "Name of the Firehose Role to use for Cloudwatch Metrics."
  default     = null
  type        = string
}

variable "firehose_metrics_delivery_stream_name" {
  description = "Name of the Firehose Delivery Stream to use for Cloudwatch Metrics."
  default     = null
  type        = string
}

variable "firehose_vpc_delivery_stream_name" {
  description = "Name of the Firehose Delivery Stream to use for VPC Flow Logs."
  default     = null
  type        = string
}

variable "firehose_s3_bucket_name" {
  description = "Name of the S3 Bucket to use for Firehose."
  default     = null
  type        = string
}
