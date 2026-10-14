output "id" {
  description = "The ID of the network interface"
  value       = azurerm_network_interface.this.id
}

output "private_ip_address" {
  description = "The private IP address assigned to the network interface"
  value       = azurerm_network_interface.this.private_ip_address
}
