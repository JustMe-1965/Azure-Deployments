# Azure Deployments

This Terraform configuration creates an Azure resource group, virtual network,
subnet, and an Ubuntu Server 24.04 LTS virtual machine connected to that subnet.
Ubuntu is free to use; Azure charges may still apply for the VM, disks, and other
resources.

The resource group and virtual network use Azure Verified Modules. The network
interface and Linux virtual machine are defined in reusable local modules under
`modules/`.

Set `vm_admin_password` through a protected input method such as an environment
variable (`TF_VAR_vm_admin_password`) or a secrets manager. Do not commit
passwords or secret-bearing `.tfvars` files.

The virtual machine size, name, administrator username, and deployment region
can be overridden with Terraform variables. The default VM size is
`Standard_D2as_v6` in `Central US`. Azure lists this SKU without restrictions,
and the subscription has quota available for its VM family. Actual capacity can
still vary. The VM uses password authentication and has no public IP address.
