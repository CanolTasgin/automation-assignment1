resource "azurerm_log_analytics_workspace" "law" { # create a Log Analytics workspace to store VM metrics
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  tags                = var.tags
}

resource "azurerm_recovery_services_vault" "rsv" { # create a Recovery Services vault to store VM backups
  name                = var.recovery_services_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_storage_account" "sa" { # create a storage account to store VM backups
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}
