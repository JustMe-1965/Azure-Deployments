variable "name" {
  description = "The name of the network interface"
  type        = string
}

variable "location" {
  description = "The Azure location where the network interface will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group containing the network interface"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to attach to the network interface"
  type        = string
}
