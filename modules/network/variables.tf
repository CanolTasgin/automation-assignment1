variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Location"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
}

variable "address_space" {
  description = "Address Space for the Virtual Network"
  type        = list(string)
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address Prefixes for the Subnet"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
