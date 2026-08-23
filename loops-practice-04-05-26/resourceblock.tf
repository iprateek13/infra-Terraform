
resource "azurerm_resource_group" "example11" {
  name     = var.rgname
  location = var.rglocation
}

# resource "azurerm_storage_account" "storage" {
#   name                            = "motabadadabba"
#   resource_group_name             = azurerm_resource_group.example11.name
#   location                        = azurerm_resource_group.example11.location
#   account_tier                    = "Standard"
#   account_replication_type        = "LRS"
#   allow_nested_items_to_be_public = true
# }
# resource "azurerm_storage_container" "name" {
#   name                = "motacontainer"
#   storage_account_id  = azurerm_storage_account.storage.id
# }