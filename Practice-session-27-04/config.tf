terraform {
  required_providers {
    azurerm={
        version="4.70.0"
        source="hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features{}
}