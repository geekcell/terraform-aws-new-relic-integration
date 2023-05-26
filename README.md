<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-new-relic-integration)](https://github.com/geekcell/terraform-aws-new-relic-integration/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-new-relic-integration?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-new-relic-integration/releases)
[![Release](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-new-relic-integration/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-new-relic-integration/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-new-relic-integration&benchmark=FEDRAMP+%28MODERATE%29)

# Terraform AWS New Relic Integration

Terraform module which creates resources to integrate AWS with New Relic by using Kinesis Firehose streams. Supports
VPC Flow logs.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_metric_stream_name"></a> [cloudwatch\_metric\_stream\_name](#input\_cloudwatch\_metric\_stream\_name) | Name of the Cloudwatch Metric Stream. | `string` | `null` | no |
| <a name="input_firehose_metrics_delivery_stream_name"></a> [firehose\_metrics\_delivery\_stream\_name](#input\_firehose\_metrics\_delivery\_stream\_name) | Name of the Firehose Delivery Stream to use for Cloudwatch Metrics. | `string` | `null` | no |
| <a name="input_firehose_role_name"></a> [firehose\_role\_name](#input\_firehose\_role\_name) | Name of the Firehose Role to use for Cloudwatch Metrics. | `string` | `null` | no |
| <a name="input_firehose_role_name_prefix"></a> [firehose\_role\_name\_prefix](#input\_firehose\_role\_name\_prefix) | Whether to use a prefix for the Firehose Role name. | `bool` | `true` | no |
| <a name="input_firehose_s3_bucket_name"></a> [firehose\_s3\_bucket\_name](#input\_firehose\_s3\_bucket\_name) | Name of the S3 Bucket to use for Firehose. | `string` | `null` | no |
| <a name="input_firehose_vpc_delivery_stream_name"></a> [firehose\_vpc\_delivery\_stream\_name](#input\_firehose\_vpc\_delivery\_stream\_name) | Name of the Firehose Delivery Stream to use for VPC Flow Logs. | `string` | `null` | no |
| <a name="input_flow_logs_vpc_ids"></a> [flow\_logs\_vpc\_ids](#input\_flow\_logs\_vpc\_ids) | List of VPC IDs to enable VPC Flow Logs for. If empty, VPC Flow Logs will not be enabled. | `list(string)` | `[]` | no |
| <a name="input_ingeration_role_name"></a> [ingeration\_role\_name](#input\_ingeration\_role\_name) | Name of the Integration Role for New Relic. | `string` | `null` | no |
| <a name="input_integration_role_name_prefix"></a> [integration\_role\_name\_prefix](#input\_integration\_role\_name\_prefix) | Whether to use a prefix for the Integration Role name. | `bool` | `true` | no |
| <a name="input_metric_stream_role_name"></a> [metric\_stream\_role\_name](#input\_metric\_stream\_role\_name) | Name of the Metric Stream Role to use for Cloudwatch Metrics. | `string` | `null` | no |
| <a name="input_metric_stream_role_name_prefix"></a> [metric\_stream\_role\_name\_prefix](#input\_metric\_stream\_role\_name\_prefix) | Whether to use a prefix for the Metric Stream Role name. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name or prefix for the resources. | `string` | `"new-relic"` | no |
| <a name="input_new_relic_account_id"></a> [new\_relic\_account\_id](#input\_new\_relic\_account\_id) | Unique identifier for New Relic account. | `string` | n/a | yes |
| <a name="input_new_relic_cloudwatch_metrics_endpoint"></a> [new\_relic\_cloudwatch\_metrics\_endpoint](#input\_new\_relic\_cloudwatch\_metrics\_endpoint) | New Relic Cloudwatch Endpoint for either EU or US. | `string` | `"https://aws-api.eu01.nr-data.net/cloudwatch-metrics/v1"` | no |
| <a name="input_new_relic_firehose_endpoint"></a> [new\_relic\_firehose\_endpoint](#input\_new\_relic\_firehose\_endpoint) | New Relic Firehose Endpoint for either EU or US. | `string` | `"https://aws-api.eu.newrelic.com/firehose/v1"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the resources. | `map(any)` | `{}` | no |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >= 2.37.0 |

## Resources

- resource.aws_cloudwatch_metric_stream.main (main.tf#133)
- resource.aws_flow_log.main (main.tf#282)
- resource.aws_kinesis_firehose_delivery_stream.cloudwatch_metrics (main.tf#145)
- resource.aws_kinesis_firehose_delivery_stream.vpc_flow_logs (main.tf#181)
- resource.aws_s3_bucket.main (main.tf#249)
- resource.aws_s3_bucket_acl.main (main.tf#255)
- resource.aws_s3_bucket_public_access_block.main (main.tf#270)
- resource.aws_s3_bucket_server_side_encryption_configuration.main (main.tf#260)
- resource.newrelic_api_access_key.main (main.tf#299)
- resource.newrelic_cloud_aws_link_account.main (main.tf#313)
- data source.aws_caller_identity.current (main.tf#7)

# Examples
### Minimal
```hcl
module "example" {
  source = "../../"

  new_relic_account_id = "123456789"
}
```
<!-- END_TF_DOCS -->
