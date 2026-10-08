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

resource "azurerm_network_interface" "vm" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = module.avm-res-resources-resourcegroup.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.avm-res-network-virtualnetwork.subnets["subnet1"].resource_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  computer_name       = var.vm_name
  location            = var.location
  resource_group_name = module.avm-res-resources-resourcegroup.name
  size                = var.vm_size

  network_interface_ids = [
    azurerm_network_interface.vm.id
  ]

  admin_username = var.vm_admin_username
  admin_password = var.vm_admin_password

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}
