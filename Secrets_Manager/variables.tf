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

// password creation variables
variable "length" {
  default = null
}

variable "include_lower" {
  default = null
}

variable "include_number" {
  default = null
}

variable "minimum_lower" {
  default = null
}

variable "minimum_numeric" {
  default = null
}

variable "minimum_special" {
  default = null
}

variable "minimum_upper" {
  default = null
}

variable "override_special" {
  default = ""
}

variable "include_special" {
  default = null
}

variable "include_upper" {
  default = null
}

variable "pass_version" {
  default = 1
}

