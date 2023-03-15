resource "azurerm_managed_disk" "data_disk" { # create a data disk for each VM with 10GB of storage
  count                = length(var.vm_ids)
  name                 = "n01510487-datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attachment" { # attach the data disk to the VM
  count              = length(azurerm_managed_disk.data_disk)
  managed_disk_id    = azurerm_managed_disk.data_disk[count.index].id
  virtual_machine_id = var.vm_ids[count.index % length(var.vm_ids)]
  lun                = (count.index % length(var.vm_ids)) + 1
  caching            = "ReadWrite"
}
