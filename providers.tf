terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-state"
    storage_account_name = "tfstate20260818"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

#provider "azurerm" {
 # features {}
 # use_msi      = true
 # msi_endpoint = "http://169.254.169.254/metadata/identity/oauth2/token"
}
