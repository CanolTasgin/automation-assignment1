output "hostnames" {
  description = "The hostnames of the Linux VMs"
  value       = local.vm_names
}

output "domain_names" {
  description = "The domain names of the Linux VMs"
  value       = [azurerm_public_ip.pip[0].fqdn, azurerm_public_ip.pip[1].fqdn]
}

output "private_ip_addresses" {
  description = "The private IP addresses of the Linux VMs"
  value       = [azurerm_network_interface.nic[0].private_ip_address, azurerm_network_interface.nic[1].private_ip_address]
}

output "public_ip_addresses" {
  description = "The public IP addresses of the Linux VMs"
  value       = [azurerm_public_ip.pip[0].ip_address, azurerm_public_ip.pip[1].ip_address]
}

output "vm_ids" {
  description = "The IDs of the Linux VMs"
  value       = [azurerm_linux_virtual_machine.vm[0].id, azurerm_linux_virtual_machine.vm[1].id]
}

output "network_interface_ids" {
  description = "The network interface IDs of the Linux VMs"
  value       = [azurerm_network_interface.nic[0].id, azurerm_network_interface.nic[1].id]
}

output "vm_hostnames" {
  value = azurerm_linux_virtual_machine.vm.*.name
}

output "vm_domain_names" {
  value = azurerm_public_ip.pip.*.domain_name_label
}

output "vm_private_ips" {
  value = [for nic in azurerm_network_interface.nic : nic.ip_configuration[0].private_ip_address]
}

output "vm_public_ips" {
  value = azurerm_public_ip.pip.*.ip_address
}
