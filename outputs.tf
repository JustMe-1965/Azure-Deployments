output "vm_id" {
  description = "The ID of the Linux virtual machine"
  value       = module.linux_virtual_machine.id
}

output "vm_private_ip_address" {
  description = "The private IP address assigned to the Linux virtual machine"
  value       = module.network_interface.private_ip_address
}