variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "network_interface_ids" {
  description = "Network interface IDs to associate with the load balancer"
  type        = list(string)
}

variable "probe_port" {
  description = "Port number for the load balancer probe"
  type        = number
  default     = 80
}

variable "frontend_port" {
  description = "Frontend port number for the load balancer rule"
  type        = number
  default     = 80
}

variable "backend_port" {
  description = "Backend port number for the load balancer rule"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
