output "secretsmanager_secret_arn" {
  value = aws_secretsmanager_secret.main.arn
}

output "secretsmanager_secret_version_arn" {
  value = aws_secretsmanager_secret_version.main.arn
}

output "iam_policy_read_only_arn" {
  value = try(module.read_only_iam_policy[0].arn, null)
}
