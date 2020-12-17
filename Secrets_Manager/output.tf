output "id" {
  value = aws_secretsmanager_secret.secret.id
}

output "arn" {
  value = aws_secretsmanager_secret.secret.arn
}

output "secret_string" {
  value = jsondecode(aws_secretsmanager_secret_version.secret_value.secret_string)
}

output "secret_iam_policy_arn" {
  value = aws_iam_policy.secrets_access.arn
}

