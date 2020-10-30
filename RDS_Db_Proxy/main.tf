data "aws_kms_key" "key" {
  key_id = var.kms_key_id
}

/*module "Role" {
  source = "./modules/Role"

  role_name = "rds_proxy_role"
  secret_arn = var.secret_arn
  kms_key_arn = data.aws_kms_key.key.arn
}*/

resource "aws_db_proxy" "proxy" {
  name                   = var.name
  debug_logging          = var.debug_logging
  engine_family          = var.engine_family
  idle_client_timeout    = var.idle_client_timeout
  require_tls            = var.require_tls
  role_arn               = var.role_arn//"arn:aws:iam::518970837364:role/service-role/rds-proxy-role-1603473708798" //TODO: figure out how to creat this
  vpc_security_group_ids = var.vpc_security_group_ids
  vpc_subnet_ids         = var.vpc_subnet_ids

  auth {
    auth_scheme = var.auth_scheme
    description = var.auth_description
    iam_auth = var.iam_auth
    secret_arn = var.secret_arn
    //username = var.username
  }

  tags = var.tags
}

resource "aws_db_proxy_default_target_group" "target_group" {
  db_proxy_name = aws_db_proxy.proxy.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    init_query                   = "SET x=1, y=2"
    max_connections_percent      = 100
    max_idle_connections_percent = 50
    session_pinning_filters      = ["EXCLUDE_VARIABLE_SETS"]
  }
}

resource "aws_db_proxy_target" "example" {
  db_instance_identifier = var.rds_instance
  db_proxy_name          = aws_db_proxy.proxy.name
  target_group_name      = aws_db_proxy_default_target_group.target_group.name
}
