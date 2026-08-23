resource "azurerm_virtual_network" "example" {
  for_each            = var.vnets
  name                = each.value.name
  resource_group_name = "indiarg"
  location            = "central india"
  address_space       = each.value.address
}