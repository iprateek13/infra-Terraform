terraform {
  required_providers {
    azurerm = {
      version = "4.68.0"
      source  = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {

  }
}

resource "azurerm_resource_group" "example" {
  name     = "example"
  location = "West Europe"

  tags = {
    env = "dev"
  }
}
resource "azurerm_resource_group" "example22" {
  name     = "o_biilo_rani"
  location = "West Europe"
}
resource "azurerm_storage_account" "example" {
  name                     = "kahotoabhijandede"
  resource_group_name      = "o_biilo_rani"
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on               = [azurerm_resource_group.example22]

  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "meracontainer" {
  name               = "hmardabba"
  storage_account_id = azurerm_storage_account.example.id
  depends_on         = [azurerm_storage_account.example]
}
