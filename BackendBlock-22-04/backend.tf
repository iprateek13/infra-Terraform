terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "mera-rg" # Can also be set via `ARM_USE_AZUREAD` environment variable.
    # Can also be set via `ARM_TENANT_ID` environment variable. Azure CLI will fallback to use the connected tenant ID if not supplied.
    storage_account_name = "storagerghmar"          # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "my-container"           # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "prod.terraform.tfstate" # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}
provider "azurerm" {
  features {
  }
}
resource "azurerm_resource_group" "gr_name" {
  name     = "mera-rg"
  location = "west europe"
  tags     = { environment = "staging" }
}
resource "azurerm_resource_group" "gr_name11" {
  name     = "mera-rg11"
  location = "CENTRAL INDIA"
  tags     = { environment = "staging" }
}
resource "azurerm_storage_account" "rg_storage" {
  name                     = "storagerghmar"
  resource_group_name      = azurerm_resource_group.gr_name.name
  location                 = azurerm_resource_group.gr_name.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "container" {
  name               = "my-container"
  storage_account_id = azurerm_storage_account.rg_storage.id
}