variable "name" {
  description = "The name of the Linux virtual machine"
  type        = string
}

variable "location" {
  description = "The Azure location where the virtual machine will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the virtual machine"
  type        = string
}

variable "size" {
  description = "The Azure size of the Linux virtual machine"
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the network interface attached to the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the virtual machine"
  type        = string
  sensitive   = true
}
