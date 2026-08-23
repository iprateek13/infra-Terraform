terraform {
  backend "azurerm" {
    resource_group_name  = "example-resources"
    storage_account_name = "storage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}
