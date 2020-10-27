resource "random_password" "random_string" {
  count            = var.create_secret ? 1 : 0
  length           = var.length
  lower            = var.include_lower
  number           = var.include_number
  min_lower        = var.minimum_lower
  min_numeric      = var.minimum_numeric
  min_special      = var.minimum_special
  min_upper        = var.minimum_upper
  override_special = var.override_special == "" ? null : var.override_special
  special          = var.include_special
  upper            = var.include_upper

  keepers = {
    pass_version = var.pass_version
  }
}

resource "aws_secretsmanager_secret" "secret" {
  count            = var.create_secret ? 1 : 0
  name                = var.name
  description = var.description
  kms_key_id = var.kms_key_id
  policy = var.policy
  recovery_window_in_days = var.recovery_window_in_days

  tags = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_value" {
  count            = var.create_secret ? 1 : 0
  secret_id = aws_secretsmanager_secret.secret[0].id
  secret_string = random_password.random_string[0].result
}
