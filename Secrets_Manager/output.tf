output "id" {
  value = aws_secretsmanager_secret.secret[*].id
}

output "arn" {
  value = aws_secretsmanager_secret.secret[*].arn
}

output "secret_string" {
  value = "${aws_secretsmanager_secret_version.secret_value[*].secret_string}"
}

