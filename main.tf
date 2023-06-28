/**
 * # Terraform AWS New Relic Integration
 *
 * Terraform module which creates resources to integrate AWS with New Relic by using Kinesis Firehose streams. Supports
 * VPC Flow logs. Comes with the following sub modules:
 *
 * [Fargate PHP Daemon](./modules/fargate_php_daemon/README.md)
 * [SSM License Key](./modules/ssm_license_key/README.md)
 */
data "aws_caller_identity" "current" {}

#
# INTEGRATION ROLE
#
module "iam_integration_role" {
  source = "github.com/geekcell/terraform-aws-iam-role?ref=v1"

  name            = coalesce(var.ingeration_role_name, "${var.name}-integration")
  use_name_prefix = var.integration_role_name_prefix

  description = "Role for New Relic integration."
  policy_arns = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
  assume_roles = {
    "AWS" : {
      actions     = ["sts:AssumeRole"]
      identifiers = ["754728514883"] # Unique identifier for New Relic account on AWS
      conditions = [
        {
          test     = "StringEquals"
          variable = "sts:ExternalId"
          values   = [var.new_relic_account_id]
        }
      ]
    }
  }

  tags = var.tags
}

#
# FIREHOSE ROLE
#
module "iam_firehose_role" {
  source = "github.com/geekcell/terraform-aws-iam-role?ref=v1"

  name            = coalesce(var.firehose_role_name, "${var.name}-firehose")
  use_name_prefix = var.firehose_role_name_prefix

  description = "Role for New Relic Firehose."
  policy_arns = [module.iam_firehose_policy.arn]
  assume_roles = {
    "Service" : {
      identifiers = ["firehose.amazonaws.com"]
    }
  }

  tags = var.tags
}

module "iam_firehose_policy" {
  source = "github.com/geekcell/terraform-aws-iam-policy?ref=v1"

  name            = "${var.name}-firehose"
  use_name_prefix = var.firehose_role_name_prefix

  description = "Policy for New Relic Firehose."
  statements = [
    {
      sid    = "BucketList"
      effect = "Allow"
      actions = [
        "s3:GetBucketLocation",
        "s3:ListBucket"
      ]
      resources = [aws_s3_bucket.main.arn]
    },
    {
      sid    = "BucketWrite"
      effect = "Allow"
      actions = [
        "s3:AbortMultipartUpload",
        "s3:GetObject",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject"
      ]
      resources = ["${aws_s3_bucket.main.arn}/*"]
    }
  ]

  tags = var.tags
}

#
# METRIC STREAM ROLE
#
module "iam_metric_stream_role" {
  source = "github.com/geekcell/terraform-aws-iam-role?ref=v1"

  name            = coalesce(var.metric_stream_role_name, "${var.name}-metric-stream")
  use_name_prefix = var.metric_stream_role_name_prefix

  description = "Role for New Relic Metric Stream."
  policy_arns = [module.iam_metric_stream_policy.arn]
  assume_roles = {
    "Service" : {
      identifiers = ["streams.metrics.cloudwatch.amazonaws.com"]
    }
  }

  tags = var.tags
}

module "iam_metric_stream_policy" {
  source = "github.com/geekcell/terraform-aws-iam-policy?ref=v1"

  name            = "${var.name}-metric-stream"
  use_name_prefix = var.metric_stream_role_name_prefix

  description = "Policy for New Relic Metric Stream."
  statements = [
    {
      sid    = "FirehoseWrite"
      effect = "Allow"
      actions = [
        "firehose:PutRecord",
        "firehose:PutRecordBatch"
      ]
      resources = concat([aws_kinesis_firehose_delivery_stream.cloudwatch_metrics.arn],
        length(var.flow_logs_vpc_ids) > 0 ? [aws_kinesis_firehose_delivery_stream.vpc_flow_logs[0].arn] : []
      )
    }
  ]

  tags = var.tags
}

#
# CW METRIC STREAM
#
resource "aws_cloudwatch_metric_stream" "main" {
  name          = coalesce(var.cloudwatch_metric_stream_name, var.name)
  role_arn      = module.iam_metric_stream_role.arn
  firehose_arn  = aws_kinesis_firehose_delivery_stream.cloudwatch_metrics.arn
  output_format = "opentelemetry0.7"

  tags = var.tags
}

#
# KINESES FIREHOSE STREAMS
#
resource "aws_kinesis_firehose_delivery_stream" "cloudwatch_metrics" {
  name        = coalesce(var.firehose_metrics_delivery_stream_name, "${var.name}-cloudwatch-metrics")
  destination = "http_endpoint"

  s3_configuration {
    bucket_arn          = aws_s3_bucket.main.arn
    buffer_size         = 10
    buffer_interval     = 400
    compression_format  = "GZIP"
    error_output_prefix = "metric-streams/error"
    role_arn            = module.iam_firehose_role.arn
  }

  http_endpoint_configuration {
    url                = var.new_relic_cloudwatch_metrics_endpoint
    name               = "New Relic"
    access_key         = newrelic_api_access_key.main.key
    buffering_size     = 1
    buffering_interval = 60
    retry_duration     = 60
    s3_backup_mode     = "FailedDataOnly"
    role_arn           = module.iam_firehose_role.arn

    request_configuration {
      content_encoding = "GZIP"
    }
  }

  server_side_encryption {
    enabled  = true
    key_type = "AWS_OWNED_CMK"
  }

  tags = var.tags
}

resource "aws_kinesis_firehose_delivery_stream" "vpc_flow_logs" {
  count = length(var.flow_logs_vpc_ids) > 0 ? 1 : 0

  name        = coalesce(var.firehose_vpc_delivery_stream_name, "${var.name}-vpc-flow-logs")
  destination = "http_endpoint"

  s3_configuration {
    bucket_arn          = aws_s3_bucket.main.arn
    buffer_size         = 5
    buffer_interval     = 300
    compression_format  = "GZIP"
    error_output_prefix = "vpc-flow-logs/error"
    role_arn            = module.iam_firehose_role.arn
  }

  http_endpoint_configuration {
    url                = var.new_relic_firehose_endpoint
    name               = "New Relic"
    access_key         = newrelic_api_access_key.main.key
    buffering_size     = 1
    buffering_interval = 60
    retry_duration     = 300
    s3_backup_mode     = "FailedDataOnly"
    role_arn           = module.iam_firehose_role.arn

    request_configuration {
      content_encoding = "GZIP"

      common_attributes {
        name  = "logtype"
        value = "aws-flowlogs-nr-v1"
      }

      common_attributes {
        name  = "instrumentation.provider"
        value = "aws-kinesis-firehose"
      }

      common_attributes {
        name  = "instrumentation.name"
        value = "vpc-flow-logs"
      }

      common_attributes {
        name  = "provider"
        value = "firehose-vpc"
      }

      common_attributes {
        name  = "sample_rate"
        value = "1"
      }
    }
  }

  server_side_encryption {
    enabled  = true
    key_type = "AWS_OWNED_CMK"
  }

  tags = merge(var.tags, {
    "LogDeliveryEnabled" = "true"
  })
}

#
# S3 BUCKET
#
resource "aws_s3_bucket" "main" {
  bucket = coalesce(var.firehose_s3_bucket_name, var.name)

  tags = var.tags
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket = aws_s3_bucket.main.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#
# VPC FLOW LOG
#
resource "aws_flow_log" "main" {
  for_each = toset(var.flow_logs_vpc_ids)

  vpc_id               = each.value
  log_destination      = aws_kinesis_firehose_delivery_stream.vpc_flow_logs[0].arn
  log_destination_type = "kinesis-data-firehose"
  traffic_type         = "ALL"
  log_format           = "$${version} $${account-id} $${region} $${az-id} $${sublocation-type} $${vpc-id} $${subnet-id} $${instance-id} $${interface-id} $${srcaddr} $${pkt-srcaddr} $${pkt-src-aws-service} $${dstaddr} $${pkt-dstaddr} $${pkt-dst-aws-service} $${srcport} $${dstport} $${protocol} $${packets} $${bytes} $${flow-direction} $${traffic-path} $${start} $${end} $${action} $${log-status}"

  tags = merge(var.tags, {
    "Name" = var.name
  })
}

#
# NEWRELIC API KEYS
#
resource "newrelic_api_access_key" "main" {
  name       = "${data.aws_caller_identity.current.account_id} - AWS Kinesis Firehose"
  account_id = var.new_relic_account_id

  key_type    = "INGEST"
  ingest_type = "LICENSE"
  notes       = "AWS Cloud Integrations Firehose Key."

  depends_on = [data.aws_caller_identity.current]
}

#
# NEWRELIC ACCOUNT INTEGRATIONS
#
resource "newrelic_cloud_aws_link_account" "main" {
  name                   = "${data.aws_caller_identity.current.account_id} - AWS Push"
  arn                    = module.iam_integration_role.arn
  metric_collection_mode = "PUSH"

  depends_on = [module.iam_integration_role, data.aws_caller_identity.current]
}
