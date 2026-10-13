module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  location = var.location
  name     = var.resource_group_name
}

module "avm-res-network-virtualnetwork" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.8.1"
  name    = var.vnet_name

  resource_group_name = module.avm-res-resources-resourcegroup.name
  location            = var.location
  address_space       = var.address_space

  subnets = {
    subnet1 = {
      name             = var.subnet_name
      address_prefixes = var.subnet_address_prefixes
    }
  }
}

module "network_interface" {
  source = "./modules/network-interface"

  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = module.avm-res-resources-resourcegroup.name
  subnet_id           = module.avm-res-network-virtualnetwork.subnets["subnet1"].resource_id
}

module "linux_virtual_machine" {
  source = "./modules/linux-virtual-machine"

  name                 = var.vm_name
  location             = var.location
  resource_group_name  = module.avm-res-resources-resourcegroup.name
  size                 = var.vm_size
  network_interface_id = module.network_interface.id
  admin_username       = var.vm_admin_username
  admin_password       = var.vm_admin_password
}

moved {
  from = azurerm_network_interface.vm
  to   = module.network_interface.azurerm_network_interface.this
}

moved {
  from = azurerm_linux_virtual_machine.vm
  to   = module.linux_virtual_machine.azurerm_linux_virtual_machine.this
}
