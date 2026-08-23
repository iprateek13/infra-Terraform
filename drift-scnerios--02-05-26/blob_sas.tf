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

# scenerio 1 - likh k de diya y-y lete aana
resource "azurerm_resource_group" "rg12323" {
  name     = "nayi-parchi23"
  location = "West Europe"
  tags     = { env = "dev" }
}



# scenerio-2 = new sbji added
# scene-3- parchi me se koi saman hata diya
# resource "azurerm_resource_group" "rg1234" {
#   name     = "parchi-me-nya-saman"
#   location = "West Europe"
# }



