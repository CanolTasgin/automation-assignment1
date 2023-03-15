variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region Location"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  description = "Boot Diagnostics Storage Account URI"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "admin_username" {}
