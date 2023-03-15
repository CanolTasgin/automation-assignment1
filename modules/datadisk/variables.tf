variable "vm_ids" {
  description = "All of the Virtual machine IDs to attach the data disks to"
  type        = list(string)
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
