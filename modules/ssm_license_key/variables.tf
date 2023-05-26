## NAMING
variable "tags" {
  description = "Tags to add to the created resources."
  default     = {}
  type        = map(any)
}

## SECRETS MANAGER
variable "secretsmanager_secret_name" {
  description = "Name of the SSM secret."
  default     = null
  type        = string
}

variable "secretsmanager_secret_description" {
  description = "Description of the SSM secret."
  default     = "New Relic Account ID and License key for integrating services."
  type        = string
}

## IAM POLICY
variable "create_iam_policy_read_only" {
  description = "Whether to create the IAM policy for read-only access to SSM Secret."
  default     = true
  type        = bool
}

variable "iam_policy_read_only_name" {
  description = "Name of the read-only IAM policy."
  default     = null
  type        = string
}

variable "iam_policy_read_only_use_prefix" {
  description = "Whether to use the prefix for the read-only IAM policy."
  default     = false
  type        = bool
}

## NEW RELIC KEY
variable "new_relic_account_id" {
  description = "New Relic Account ID to create the key in."
  type        = string
}

variable "new_relic_key_name" {
  description = "Name of the New Relic key to create."
  type        = string
}

variable "new_relic_ingest_type" {
  description = "Ingest type of New Relic key to create. Required if new_relic_key_type is INGEST. Valid options are BROWSER or LICENSE, case-sensitive."
  default     = "LICENSE"
  type        = string
}

variable "new_relic_key_type" {
  description = "Type of New Relic key to create. Valid options are INGEST, REST, or USER, case-sensitive."
  default     = "INGEST"
  type        = string
}

variable "new_relic_key_user_id" {
  description = "User ID of the New Relic key to create. Required if new_relic_key_type is USER."
  default     = null
  type        = string
}

variable "new_relic_key_notes" {
  description = "Notes of the New Relic key to create."
  default     = null
  type        = string
}
