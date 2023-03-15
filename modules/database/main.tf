resource "azurerm_postgresql_server" "postgres" {
  name                = "n01510487-postgresql"
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login          = "psqladmin"
  administrator_login_password = var.postgres_admin_password

  sku_name   = "B_Gen5_1"
  version    = "11"
  storage_mb = 5120

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = false

  ssl_enforcement_enabled = true

  tags = var.tags
}
