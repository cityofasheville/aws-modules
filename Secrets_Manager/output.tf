output "id" {
  value = aws_secretsmanager_secret.secret[0].id
}

output "arn" {
  value = aws_secretsmanager_secret.secret[0].arn
}

output "secret_string" {
  value = aws_secretsmanager_secret_version.secret_value[0].secret_string
}

