/**
 * # Terraform AWS New Relic SSM License Key
 *
 * This module creates an New Relic API Key and SSM SecureString parameter. Optionally it can create
 * a read-only policy for the generated secret, so this secret can easily be used by other AWS Services.
 */
resource "newrelic_api_access_key" "main" {
  account_id = var.new_relic_account_id
  name       = var.new_relic_key_name

  key_type    = var.new_relic_key_type
  ingest_type = var.new_relic_ingest_type
  user_id     = var.new_relic_key_user_id

  notes = var.new_relic_key_notes
}

resource "aws_secretsmanager_secret" "main" {
  name        = coalesce(var.secretsmanager_secret_name, "${var.new_relic_key_name}-new-relic-api-key")
  description = var.secretsmanager_secret_description

  tags = var.tags
}

# The secret is created with the following structure so it can be used by Lambda as well:
# https://github.com/newrelic/newrelic-lambda-extension/blob/main/credentials/credentials.go#L18
resource "aws_secretsmanager_secret_version" "main" {
  secret_id = aws_secretsmanager_secret.main.id
  secret_string = jsonencode({
    NrAccountId = var.new_relic_account_id
    LicenseKey  = newrelic_api_access_key.main.key

    # Non-standard fields
    KeyType    = newrelic_api_access_key.main.key_type
    IngestType = newrelic_api_access_key.main.ingest_type
  })
}

module "read_only_iam_policy" {
  count = var.create_iam_policy_read_only ? 1 : 0

  source  = "geekcell/iam-policy/aws"
  version = ">= 1.0.0, < 2.0.0"

  name            = coalesce(var.iam_policy_read_only_name, "${aws_secretsmanager_secret.main.name}-read-only")
  use_name_prefix = var.iam_policy_read_only_use_prefix

  description = "Read only policy for New Relic SSM Secret."
  statements = [
    {
      sid    = "AllowReadSecret"
      effect = "Allow"
      actions = [
        "secretsmanager:GetSecretValue"
      ]
      resources = [aws_secretsmanager_secret.main.arn]
    }
  ]

  depends_on = [aws_secretsmanager_secret.main]

  tags = var.tags
}
