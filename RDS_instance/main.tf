locals {
  family                  = "${var.engine}${var.engine_version}" //engine version includes minor version, use with caution
  sg_on_rds_instance_name = "${var.identifier}-${var.engine}-sg"
  subnet_group_name       = var.subnet_group_name != "" ? var.subnet_group_name : "${var.identifier}-${var.engine}-subnetg"
  monitoring_role = var.monitoring_role_arn != "" ? var.monitoring_role_arn : module.Role.role_arn
}

module "Subnet_Group" {
  source = "./modules/SubnetGroup"

  subnet_group_name = var.subnet_group_name != "" ? var.subnet_group_name : "${var.identifier}-${var.engine}-subnet-gr"
  subnets           = var.subnets
  tags              = var.tags
}

module "Security_Group" {
  source = "./modules/SecurityGroup"

  vpc_id          = var.vpc_id
  name            = local.sg_on_rds_instance_name
  description     = local.sg_on_rds_instance_name
  cidr_blocks     = var.sg_cidr_blocks
  port            = var.port
  security_groups = var.security_groups_for_ingress
  tags            = var.tags

}

module "Role" {
  source = "./modules/Role"

  role_name = var.role_name
  tags = var.tags
}

module "Secrets" {
  source = "git@github.com:cityofasheville/aws-modules.git//Secrets_Manager"
  //source = "../../../aws-modules/Secrets_Manager"

  create_secret = var.create_secret
  name = var.secret_name
  description = var.secret_description
  length = var.secret_length
  include_lower = var.inc_lower
  include_number = var.inc_number
  include_special = var.inc_special
  include_upper = var.inc_upper

  tags = var.tags

}

resource "aws_db_instance" "rds_instance" {
  allocated_storage                   = var.allocated_storage
  allow_major_version_upgrade         = var.allow_major_version_upgrade
  apply_immediately                   = var.apply_immediately
  auto_minor_version_upgrade          = var.auto_minor_version_upgrade
  availability_zone                   = var.availability_zone
  backup_retention_period             = var.backup_retention_period
  backup_window                       = var.backup_window
  ca_cert_identifier                  = var.ca_cart_identifier
  character_set_name                  = var.character_set_name
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot
  db_subnet_group_name                = module.Subnet_Group.name
  delete_automated_backups            = var.delete_automated_backups
  deletion_protection                 = var.deletion_protection
  domain                              = var.domain
  domain_iam_role_name                = var.domain_iam_role_name
  enabled_cloudwatch_logs_exports     = var.enabled_cloudwatch_logs_exports
  engine                              = var.engine
  engine_version                      = var.engine_version
  final_snapshot_identifier           = var.final_snapshot_identifier
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  identifier                          = var.identifier
  //identifier_prefix           = var.identifier_prefix
  instance_class        = var.instance_class
  iops                  = var.iops
  kms_key_id            = var.kms_key_id
  license_model         = var.license_model
  maintenance_window    = var.maintenance_window
  max_allocated_storage = var.max_allocated_storage
  monitoring_interval   = var.monitoring_interval
  monitoring_role_arn   = module.Role.role_arn
  multi_az              = var.multi_az
  name                  = var.name
  option_group_name     = var.option_group_name
  parameter_group_name  = var.parameter_group_name
  password              = "${module.Secrets.secret_string[0]}"
  publicly_accessible   = var.publicly_accessible
  replicate_source_db   = var.replicate_source_db
  // security_group_names   = []
  skip_final_snapshot    = var.skip_final_snapshot
  snapshot_identifier    = var.snapshot_identifier
  storage_encrypted      = var.storage_encrypted
  storage_type           = var.storage_type
  tags                   = var.tags
  timezone               = var.timezone
  username               = var.username
  vpc_security_group_ids = [module.Security_Group.id]
  //s3_import = var.s3_import
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period

}
