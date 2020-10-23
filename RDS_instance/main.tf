locals {
  family                  = "${var.engine}${var.engine_version}"
  sg_on_rds_instance_name = "${var.identifier}_-${local.family}"
  subnet_group_name       = var.subnet_group_name != "" ? var.subnet_group_name : "${var.identifier}-${local.family}-subnetg"

}

module "Subnet_Group" {
  source = "./modules/SubnetGroup"

  subnet_group_name = var.subnet_group_name != "" ? var.subnet_group_name : "${var.identifier}-${local.family}-subnet-gr"
  subnets = var.subnets
  tags = var.tags
}

resource "aws_db_instance" "mod" {
  allocated_storage                  = var.allocated_storage
  allow_major_version_upgrade        = var.allow_major_version_upgrade
  apply_immediately                  = var.apply_immediately
  auto_minor_version_upgrade         = var.auto_minor_version_upgrade
  availability_zone                  = var.availability_zone
  backup_retention_period            = var.backup_retention_period
  backup_window                      = var.backup_window
  ca_cert_identifier                 = var.ca_cart_identifier
  character_set_name                 = var.character_set_name
  copy_tags_to_snapshot              = var.copy_tags_to_snapshot
  db_subnet_group_name               = module.Subnet_Group.name
  delete_automated_backups           = var.delete_automated_backups
  deletion_protection                = var.deletion_protection
  domain                             = var.domain
  domain_iam_role_name               = var.domain_iam_role_name
  enabled_cloudwatch_logs_exports    = var.enabled_cloudwatch_logs_exports
  engine                             = var.engine
  engine_version                     = var.engine_version
  final_snapshot_identifier          = var.engine_version
  iam_database_authentication_enabled = var.iam_database_authentication_enabled
  identifier                         = var.identifier
  //identifier_prefix           = var.identifier_prefix
  instance_class         = var.instance_class
  iops                   = var.iops
  kms_key_id             = var.kms_key_id
  license_model          = var.license_model
  maintenance_window     = var.maintenance_window
  max_allocated_storage  = var.max_allocated_storage
  monitoring_interval    = var.monitoring_interval
  monitoring_role_arn    = var.monitoring_role_arn != "" ? var.monitoring_role_arn : module.Role.role_arn
  multi_az               = var.multi_az
  name                   = var.name
  option_group_name      = var.option_group_name
  parameter_group_name   = var.parameter_group_name
  password               = var.password
  port                   = var.port
  publicly_accessible    = var.publicly_accessible
  replicate_source_db    = var.replicate_source_db
 // security_group_names   = []
  skip_final_snapshot    = var.skip_final_snapshot
  snapshot_identifier    = var.snapshot_identifier
  storage_encrypted      = var.storage_encrypted
  storage_type           = var.storage_type
  tags                   = var.tags
  timezone               = var.timezone
  username               = var.username
  vpc_security_group_ids = var.vpc_security_group_ids != 0 ? concat(var.vpc_security_group_ids, list(module.SecurityGroup.id)) : concat(module.SecurityGroup.id, list(""))
  //s3_import = var.s3_import
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period
}

module "SecurityGroup" {
  source = "./modules/SecurityGroup"

  name = local.sg_on_rds_instance_name
  description = local.sg_on_rds_instance_name
  vpc_id = var.vpc_id
  cidr_blocks = var.sg_cidr_blocks
  security_groups = var.vpc_security_group_ids



}

module "Role" {
  source = "./modules/Role"


}
