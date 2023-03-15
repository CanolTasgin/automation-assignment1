locals {
  common_tags = {
    Project        = "Automation Project – Assignment 1"
    Name           = "Canol.Tasgin"
    ExpirationDate = "2023-06-30"
    Environment    = "Lab"
  }
}

module "rgroup" {
  source              = "./modules/rgroup"
  resource_group_name = "n01510487-assignment1-RG"
  location            = "canadacentral"
  tags                = local.common_tags
}

module "network" {
  source                  = "./modules/network"
  resource_group_name     = module.rgroup.resource_group_name
  location                = "canadacentral"
  virtual_network_name    = "n01510487-vnet"
  address_space           = ["10.0.0.0/16"]
  subnet_name             = "n01510487-subnet"
  subnet_address_prefixes = ["10.0.1.0/24"]
  tags                    = local.common_tags
}

module "common" {
  source                       = "./modules/common"
  resource_group_name          = module.rgroup.resource_group_name
  location                     = "canadacentral"
  log_analytics_workspace_name = "n01510487-law"
  recovery_services_vault_name = "n01510487-rsv"
  storage_account_name         = "n01510487sa"
  tags                         = local.common_tags
}

module "vmlinux" {
  source                               = "./modules/vmlinux"
  resource_group_name                  = module.rgroup.resource_group_name
  location                             = "canadacentral"
  subnet_id                            = module.network.subnet_id
  boot_diagnostics_storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                                 = local.common_tags
  admin_username                       = "admin0487"
}

module "vmwindows" {
  source                               = "./modules/vmwindows"
  resource_group_name                  = module.rgroup.resource_group_name
  location                             = "canadacentral"
  subnet_id                            = module.network.subnet_id
  boot_diagnostics_storage_account_uri = module.common.storage_account_primary_blob_endpoint
  tags                                 = local.common_tags
}

module "datadisk" {
  source              = "./modules/datadisk"
  vm_ids              = concat(module.vmlinux.vm_ids, [module.vmwindows.vm_id])
  resource_group_name = module.rgroup.resource_group_name
  location            = "canadacentral"
  tags                = local.common_tags
}

module "loadbalancer" {
  source                = "./modules/loadbalancer"
  resource_group_name   = module.rgroup.resource_group_name
  location              = "canadacentral"
  network_interface_ids = module.vmlinux.network_interface_ids
  tags                  = local.common_tags
}

module "database" {
  source                  = "./modules/database"
  resource_group_name     = module.rgroup.resource_group_name
  location                = "canadacentral"
  postgres_admin_password = "P@ssw0rd"
  tags                    = local.common_tags
}
