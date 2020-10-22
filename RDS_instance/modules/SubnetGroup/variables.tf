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
  description = "A list of subnets that the RDS instance can be added to. Either subnets or subnet_group_name must be specified."
  default     = []
}

variable "description" {
  default = null
}

variable "tags" {
  type = map(string)
  default = {}
}
