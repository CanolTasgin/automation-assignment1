locals {
  vm_names = ["n01510487-vm1", "n01510487-vm2"]
}

resource "azurerm_network_interface" "nic" {
  count               = 2
  name                = "${local.vm_names[count.index]}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip[count.index].id
  }
  tags = var.tags
}

resource "azurerm_availability_set" "aset" {
  name                         = "n01510487-aset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  tags                         = var.tags
}

resource "azurerm_public_ip" "pip" {
  count               = 2
  name                = "${local.vm_names[count.index]}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "canol-${local.vm_names[count.index]}"
  tags                = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count                 = 2
  name                  = local.vm_names[count.index]
  admin_username        = "admin0487"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic[count.index].id]
  availability_set_id   = azurerm_availability_set.aset.id
  size                  = "Standard_B1ms"

  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = file("/Users/canoltasgin/.ssh/id_rsa.pub")
  }


  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "network_watcher_agent" {
  count                      = 2
  name                       = "NetworkWatcherAgentLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.vm[count.index].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true
}
