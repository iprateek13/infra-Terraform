provider "azuerm" {
  features {

  }
}
terraform {
  required_providers {
    azuerm={
        source = "hashicorp/azurerm"
        version = "4.77.0"
    }
  }
}