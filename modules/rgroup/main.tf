resource "azurerm_resource_group" "rg" { # create a resource group
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}
