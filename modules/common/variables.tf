variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region Location"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace Name"
  type        = string
}

variable "recovery_services_vault_name" {
  description = "Recovery Services Vault Name"
  type        = string
}

variable "storage_account_name" {
  description = "Storage Account Name"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
