<!-- BEGIN_TF_DOCS -->
# Terraform AWS New Relic SSM License Key

This module creates an New Relic API Key and SSM SecureString parameter. Optionally it can create
a read-only policy for the generated secret, so this secret can easily be used by other AWS Services.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_iam_policy_read_only"></a> [create\_iam\_policy\_read\_only](#input\_create\_iam\_policy\_read\_only) | Whether to create the IAM policy for read-only access to SSM Secret. | `bool` | `true` | no |
| <a name="input_iam_policy_read_only_name"></a> [iam\_policy\_read\_only\_name](#input\_iam\_policy\_read\_only\_name) | Name of the read-only IAM policy. | `string` | `null` | no |
| <a name="input_iam_policy_read_only_use_prefix"></a> [iam\_policy\_read\_only\_use\_prefix](#input\_iam\_policy\_read\_only\_use\_prefix) | Whether to use the prefix for the read-only IAM policy. | `bool` | `false` | no |
| <a name="input_new_relic_account_id"></a> [new\_relic\_account\_id](#input\_new\_relic\_account\_id) | New Relic Account ID to create the key in. | `string` | n/a | yes |
| <a name="input_new_relic_ingest_type"></a> [new\_relic\_ingest\_type](#input\_new\_relic\_ingest\_type) | Ingest type of New Relic key to create. Required if new\_relic\_key\_type is INGEST. Valid options are BROWSER or LICENSE, case-sensitive. | `string` | `"LICENSE"` | no |
| <a name="input_new_relic_key_name"></a> [new\_relic\_key\_name](#input\_new\_relic\_key\_name) | Name of the New Relic key to create. | `string` | n/a | yes |
| <a name="input_new_relic_key_notes"></a> [new\_relic\_key\_notes](#input\_new\_relic\_key\_notes) | Notes of the New Relic key to create. | `string` | `null` | no |
| <a name="input_new_relic_key_type"></a> [new\_relic\_key\_type](#input\_new\_relic\_key\_type) | Type of New Relic key to create. Valid options are INGEST, REST, or USER, case-sensitive. | `string` | `"INGEST"` | no |
| <a name="input_new_relic_key_user_id"></a> [new\_relic\_key\_user\_id](#input\_new\_relic\_key\_user\_id) | User ID of the New Relic key to create. Required if new\_relic\_key\_type is USER. | `string` | `null` | no |
| <a name="input_secretsmanager_secret_description"></a> [secretsmanager\_secret\_description](#input\_secretsmanager\_secret\_description) | Description of the SSM secret. | `string` | `"New Relic Account ID and License key for integrating services."` | no |
| <a name="input_secretsmanager_secret_name"></a> [secretsmanager\_secret\_name](#input\_secretsmanager\_secret\_name) | Name of the SSM secret. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the created resources. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_policy_read_only_arn"></a> [iam\_policy\_read\_only\_arn](#output\_iam\_policy\_read\_only\_arn) | n/a |
| <a name="output_secretsmanager_secret_arn"></a> [secretsmanager\_secret\_arn](#output\_secretsmanager\_secret\_arn) | n/a |
| <a name="output_secretsmanager_secret_version_arn"></a> [secretsmanager\_secret\_version\_arn](#output\_secretsmanager\_secret\_version\_arn) | n/a |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |
| <a name="provider_newrelic"></a> [newrelic](#provider\_newrelic) | >= 2.37.0 |

## Resources

- resource.aws_secretsmanager_secret.main (modules/ssm_license_key/main.tf#18)
- resource.aws_secretsmanager_secret_version.main (modules/ssm_license_key/main.tf#27)
- resource.newrelic_api_access_key.main (modules/ssm_license_key/main.tf#7)
<!-- END_TF_DOCS -->
