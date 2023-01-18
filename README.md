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
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS Account ID to integrate into New Relic. Will use current AWS Account if left blank. | `string` | `null` | no |
| <a name="input_flow_logs_vpc_ids"></a> [flow\_logs\_vpc\_ids](#input\_flow\_logs\_vpc\_ids) | List of VPC IDs to enable VPC Flow Logs for. If empty, VPC Flow Logs will not be enabled. | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name or prefix for the resources. | `string` | `"new-relic"` | no |
| <a name="input_new_relic_cloudwatch_metrics_endpoint"></a> [new\_relic\_cloudwatch\_metrics\_endpoint](#input\_new\_relic\_cloudwatch\_metrics\_endpoint) | New Relic Cloudwatch Endpoint for either EU or US. | `string` | `"https://aws-api.eu01.nr-data.net/cloudwatch-metrics/v1"` | no |
| <a name="input_new_relic_external_id"></a> [new\_relic\_external\_id](#input\_new\_relic\_external\_id) | The New Relic side AWS Account ID. | `string` | `"754728514883"` | no |
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

- resource.aws_cloudwatch_metric_stream.main (main.tf#127)
- resource.aws_flow_log.main (main.tf#276)
- resource.aws_kinesis_firehose_delivery_stream.cloudwatch_metrics (main.tf#139)
- resource.aws_kinesis_firehose_delivery_stream.vpc_flow_logs (main.tf#175)
- resource.aws_s3_bucket.main (main.tf#243)
- resource.aws_s3_bucket_acl.main (main.tf#249)
- resource.aws_s3_bucket_public_access_block.main (main.tf#264)
- resource.aws_s3_bucket_server_side_encryption_configuration.main (main.tf#254)
- resource.newrelic_api_access_key.main (main.tf#293)
- resource.newrelic_cloud_aws_link_account.main (main.tf#307)
- data source.aws_caller_identity.current (main.tf#7)

# Examples
### Minimal
```hcl
module "example" {
  source = "../../"
}
```
<!-- END_TF_DOCS -->
