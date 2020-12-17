

resource "aws_secretsmanager_secret" "secret" {

  name                = var.name
  description = var.description
  kms_key_id = var.kms_key_id
  policy = var.policy
  recovery_window_in_days = var.recovery_window_in_days

  tags = var.tags
}

data "template_file" "secret_policy" {
  template = file("secret_policy.json")

  vars = {
    resource = aws_secretsmanager_secret.secret.arn
  }
}

resource aws_iam_policy secrets_access {
  policy = data.template_file.secret_policy.rendered
}

resource "aws_secretsmanager_secret_version" "secret_value" {

  secret_id = aws_secretsmanager_secret.secret.id
  // this needs to be re-worked right not these vars are rds specific
  secret_string = jsonencode(
  {
    username = var.dbusername
    password = var.dbpassword
    endpoint = var.endpoint
    port = var.port
    family = var.family
  }
  )
}
