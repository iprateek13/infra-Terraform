terraform {
  backend "azurerm" {
    resource_group_name  = "rg-mono"
    storage_account_name = "rgmonostorage"
    container_name       = "newmono"
    key                  = "dev.terraform.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
