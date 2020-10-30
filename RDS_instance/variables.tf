variable "allocated_storage" {
  description = "Reguired unless a snapshot_identifier or replicate_source_db is provided."
  default     = 50
}

variable "allow_major_version_upgrade" {
  description = "Indicates that major version upgrades are allowed. Changing this parameter does not result in an outage and the change is asynchronously applied as soon as possible."
  default     = null
}

variable "apply_immediately" {
  description = " Specifies whether any database modifications are applied immediately, or during the next maintenance window."
  default     = null
}

variable "auto_minor_version_upgrade" {
  description = "Indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window."
  default     = false
}

variable "availability_zone" {
  default = null
}

variable "backup_retention_period" {
  description = "Backup retention period for AWS RDS instance in days. Must be between 0 and 35. Must be greater than 0 if the database is used as a source for a Read Replica."
  default     = 7
}

variable "backup_window" {
  description = "time range in UTC"
  default     = null
}

variable "ca_cart_identifier" {
  default = null
}

variable "character_set_name" {
  default = null
}

variable "copy_tags_to_snapshot" {
  type        = bool
  description = "Copy all Instance tags to snapshots."
  default     = true
}

variable "db_subnet_group_name" {
  default = null
}

variable "delete_automated_backups" {
  default = null
}

variable "deletion_protection" {
  default = null
}

variable "domain" {
  default = null
}

variable "domain_iam_role_name" {
  description = "required if domain is provided"
  default     = null
}

variable "enabled_cloudwatch_logs_exports" {
  type        = set(string)
  description = "Types depend on the engine. Available types for PostgreSQL are postgresql, upgrade."
  default     = null
}

variable "engine" {
  description = "Reguired unless a snapshot_identifier or replicate_source_db is provided. Types are aurora, aurora-mysql, aurora-postgresql, mariadb, mysql, oracle-ee, oracle-se2, oracle-se1, oracle-se, postgres, sqlserver-ee, sqlserver-se, sqlserver-ex, sqlserver-web"
  default     = "postgres"
}

variable "engine_version" {
  default = null
}

variable "final_snapshot_identifier" {
  description = "Required if skip_final_snapshot is false"
  default     = null
}

variable "iam_database_authentication_enabled" {
  default = null
}

variable "identifier" {
  description = "Forces new resource."
  default     = null
}

variable "identifier_prefix" {
  description = "conflicts with identifier"
  default     = null
}

variable "instance_class" {
  default = "t3.micro"
}

variable "iops" {
  description = "Setting this implies a storage_type of 'io1'"
  default     = null
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. If creating an encrypted replica, set this to the destination KMS ARN."
  default     = null
}

variable "license_model" {
  default = null
}

variable "maintenance_window" {
  description = "Syntax: 'ddd:hh24:mi-ddd:hh24:mi'"
  default     = null
}

variable "max_allocated_storage" {
  description = "Must be greater or equal to allocated_storage or 0 to disable storage autoscalling."
  default     = null
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  default     = null
}

variable "monitoring_role_arn" {
  default = null
}

variable "multi_az" {
  type    = bool
  default = null
}

variable "name" {
  description = "The name of the database to create when the DB instance is created. If this parameter is not specified, no database is created in the DB instance."
  default     = null
}

variable "option_group_name" {
  default = null
}

variable "parameter_group_name" {
  default = null
}

variable "password" {
  type = string
  description = "Reguired unless a snapshot_identifier or replicate_source_db is provided. Note that this may show up in logs, and it will be stored in the state file."
  default     = "nopassword"
}

variable "port" {
  default = null
}

variable "publicly_accessible" {
  default = false
}

variable "replicate_source_db" {
  default = null
}

variable "security_group_names" {
  description = "(Optional/Deprecated) List of DB Security Groups to associate. Only used for DB Instances on the EC2-Classic Platform."
  default     = null
}

variable "skip_final_snapshot" {
  default = null
}

variable "snapshot_identifier" {
  default = null
}

variable "storage_encrypted" {
  default = null
}

variable "storage_type" {
  description = "One of 'standard'(magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD). The default is 'io1' if iops is specified, 'gp2' if not."
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "timezone" {
  description = "Only supported for MSSQL"
  default     = null
}

variable "username" {
  description = "Reguired unless a snapshot_identifier or replicate_source_db is provided. Username for master DB user."
  default     = null
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security groups to associate."
  default     = null
}

variable "s3_import" {
  description = "Restore from a Percona Xtrabackup in S3. (MySQL)"
  default     = null
}

variable "performance_insights_enabled" {
  default = null
}

variable "performance_insights_kms_key_id" {
  description = "The ARN for the KMS key to encrypt Performance Insights data. Once set, it can never be changed."
  default     = null
}

variable "performance_insights_retention_period" {
  description = "The amount of time in days to retain Performance Insights data. Either 7 (7 days) or 731 (2 years)."
  default     = null
}

// security group variables
variable "vpc_id" {
  description = "VPC id to associate this RDS instance with."
}

variable "security_groups_for_ingress" {
  type = list(string)
  description = "Security groups which should be allowed ingress on the RDS instance."
  default     = []
}

variable "sg_cidr_blocks" {
  type        = list(string)
  description = "cidr_blocks to give RDS port access to."
  default     = []
}

//subnet group variables

variable "subnet_group_name" {
  description = "Set db subnet group name. Either subnets or subnet_group_name must be specified."
  default     = ""
}

variable "create_db_subnet_group" {
  description = "Create a db subnet group specific to this database"
  default     = true
}

variable "subnets" {
  type = list(string)
  description = "A list of subnets that the RDS instance can be added to. Either subnets or subnet_group_name must be specified."
  default     = []
}

variable "role_name" {
  default = null
}

//secret module variables

variable "create_secret" {
  default = null
}

variable "secret_name" {
  default = null
}

variable "secret_description" {
  default = null
}

variable "secret_length" {
  default = null
}

variable "inc_lower" {
  default = null
}

variable "inc_number" {
  default = null
}

variable "inc_special" {
  default = null
}

variable "inc_upper" {
  default = null
}
