output "resource_group_name" {
  value       = module.rgroup.resource_group_name
  description = "Resource Group Name"
}

output "virtual_network_name" {
  value       = module.network.virtual_network_name
  description = "Virtual Network Name"
}

output "subnet_name" {
  value       = module.network.subnet_name
  description = "Subnet Name"
}

output "log_analytics_workspace_name" {
  value       = module.common.log_analytics_workspace_name
  description = "Log Analytics Workspace Name"
}

output "recovery_services_vault_name" {
  value       = module.common.recovery_services_vault_name
  description = "Recovery Services Vault Name"
}

output "storage_account_name" {
  value       = module.common.storage_account_name
  description = "Storage Account Name"
}

output "vm_hostnames" {
  value       = module.vmlinux.vm_hostnames
  description = "Linux VM Hostnames"
}

output "vm_domain_names" {
  value       = module.vmlinux.vm_domain_names
  description = "Domain names of the created Linux VMs"
}

output "vm_private_ips" {
  value       = module.vmlinux.vm_private_ips
  description = "Private IP addresses"
}

output "vm_public_ips" {
  value       = module.vmlinux.vm_public_ips
  description = "Public IP addresses"
}

output "vmwindows_hostname" {
  value       = module.vmwindows.vm_hostname
  description = "Windows VM hostname"
}

output "vmwindows_domain_name" {
  value       = module.vmwindows.vm_domain_name
  description = "Windows VM domain name"
}

output "vmwindows_private_ip" {
  value       = module.vmwindows.vm_private_ip
  description = "Windows VM private IP address"
}

output "vmwindows_public_ip" {
  value       = module.vmwindows.vm_public_ip
  description = "Windows VM public IP address"
}

output "load_balancer_name" {
  value       = module.loadbalancer.load_balancer_name
  description = "Load Balancer Name"
}

output "postgresql_server_name" {
  value       = module.database.postgresql_server_name
  description = "PostgreSQL Server Name"
}
