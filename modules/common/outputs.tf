output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.law.name
  description = "Log Analytics Workspace Name"
}

output "recovery_services_vault_name" {
  value       = azurerm_recovery_services_vault.rsv.name
  description = "Recovery Services Vault Name"
}

output "storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Storage Account Name"
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.sa.primary_blob_endpoint
  description = "The primary blob endpoint of the created storage account"
}
