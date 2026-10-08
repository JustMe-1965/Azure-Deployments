variable "location" {
  description = "The Azure location where resources will be deployed"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "myResourceGroup"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "myVNet"
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "mySubnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.0.0/24"]
}

variable "vm_name" {
  description = "The name of the Windows virtual machine"
  type        = string
  default     = "myWindowsVM"

  validation {
    condition     = length(var.vm_name) <= 15
    error_message = "vm_name must be 15 characters or fewer because it is also used as the Windows computer name."
  }
}

variable "vm_size" {
  description = "The Azure size of the Windows virtual machine"
  type        = string
  default     = "Standard_D2s_v5"
}

variable "vm_admin_username" {
  description = "The administrator username for the Windows virtual machine"
  type        = string
  default     = "azureadmin"
}

variable "vm_admin_password" {
  description = "The administrator password for the Windows virtual machine; it must meet Azure's Windows password requirements"
  type        = string
  sensitive   = true
}
