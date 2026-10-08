output "vm_id" {
  description = "The ID of the Windows virtual machine"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "vm_private_ip_address" {
  description = "The private IP address assigned to the Windows virtual machine"
  value       = azurerm_network_interface.vm.private_ip_address
}