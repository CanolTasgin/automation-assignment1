resource "azurerm_availability_set" "aset" { # create an availability set for the VM
  name                         = "n01510487-windows-aset"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
  tags                         = var.tags
}

resource "azurerm_network_interface" "nic" { # create a network interface for the VM
  name                = "n01510487-windows-vm-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig0487"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
}

resource "azurerm_public_ip" "pip" { # create a public IP address for the VM
  name                = "n01510487-windows-vm-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = "n01510487-dnslabel-canol"
  tags                = var.tags
}

resource "azurerm_windows_virtual_machine" "vm" { # create a Windows VM
  name                  = "n01510487-wvm"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.nic.id]
  size                  = "Standard_B1ms"

  admin_username = "admin0487"
  admin_password = "N01510487!"

  availability_set_id = azurerm_availability_set.aset.id

  source_image_reference { # use the latest Windows Server 2016 image
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  os_disk { # create a data disk for the VM
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  boot_diagnostics { # enable boot diagnostics to store VM boot logs
    storage_account_uri = var.boot_diagnostics_storage_account_uri
  }

  tags = var.tags
}

resource "azurerm_virtual_machine_extension" "antimalware" { # create an extension to enable antimalware for security
  name                 = "n01510487-windows-vm-antimalware"
  virtual_machine_id   = azurerm_windows_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.5"

  settings = <<SETTINGS
 {
  "AntimalwareEnabled": true
 }
SETTINGS

  tags = var.tags
}
