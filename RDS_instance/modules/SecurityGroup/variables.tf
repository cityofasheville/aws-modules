// security group variables
variable "name" {
  type = string
  default = ""
}

variable "description" {
  type = string
  default = ""
}

variable "vpc_id" {
  description = "VPC id to associate this RDS instance with."
}

variable "cidr_blocks" {
  type = list(string)
  description = "cidr_blocks to give RDS port access to."
  default     = []
}

variable "port" {
  default = null
}

variable "security_groups" {
  type = list(string)
  description = "Security groups which should be allowed ingress on the RDS instance."
  default     = []
}



variable "tags" {
  default = {}
}
