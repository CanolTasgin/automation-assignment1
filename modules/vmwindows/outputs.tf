output "vm_hostname" {
  value       = azurerm_windows_virtual_machine.vm.name
  description = "Windows VM hostname"
}

output "vm_domain_name" {
  value       = azurerm_public_ip.pip.domain_name_label
  description = "Windows VM domain name"
}

output "vm_private_ip" {
  value       = azurerm_network_interface.nic.ip_configuration[0].private_ip_address
  description = "Windows VM private IP address"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Windows VM public IP address"
}

output "vm_id" {
  value       = azurerm_windows_virtual_machine.vm.id
  description = "The ID of the created Windows VM"
}
