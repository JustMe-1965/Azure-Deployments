# Azure Deployments

This Terraform configuration creates an Azure resource group, virtual network,
subnet, and a Windows Server 2022 virtual machine connected to that subnet.

Set `vm_admin_password` through a protected input method such as an environment
variable (`TF_VAR_vm_admin_password`) or a secrets manager. Do not commit
passwords or secret-bearing `.tfvars` files.

The virtual machine size, name, and administrator username can be overridden
with Terraform variables. The default size is `Standard_D2s_v5`. VM size
availability varies by region and can change over time; if Azure reports a
capacity restriction, try another size or region.
