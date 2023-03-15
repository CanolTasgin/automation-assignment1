variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "boot_diagnostics_storage_account_uri" {
  description = "URI of Storage Account for Boot Diagnostics"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
