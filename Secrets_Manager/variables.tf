variable "create_secret" {
  default = 0
}

variable "name" {
  default = null
}

variable "description" {
  default = null
}

variable "kms_key_id" {
  default = null
}

variable "policy" {
  default = null
}

variable "recovery_window_in_days" {
  type = number
  default = 0
}

variable "tags" {
  type = map(string)
  default = {}
}



variable "dbusername" {
  type = string
  default = ""
}

variable "dbpassword" {}
variable "endpoint" {
  default = null
}
variable "port" {
  default = null
}
variable "family" {
  default = null
}
