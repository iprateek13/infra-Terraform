terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.65.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}
resource "azurerm_resource_group" "example11" {
  name     = "example-resources"
  location = "West Europe"
}



resource "azurerm_storage_account" "storage" {
  name                = "prateekstorage123" 
  resource_group_name = azurerm_resource_group.example11.name
  location            = azurerm_resource_group.example11.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = true

}
resource "azurerm_storage_container" "example" {
  name                  = "container123"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "blob"
}
resource "azurerm_storage_blob" "example" {
  name                   = "MyFormalPic.jpeg"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "C:/Users/asus/Downloads/Pi7PassportPhoto.jpeg"
  content_type = "image/jpeg"
   
}