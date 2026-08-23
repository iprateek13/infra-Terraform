resource "azurerm_virtual_network" "virtnet" {
  for_each            = var.vnets
  name                = each.value.name
  address_space       = each.value.address_space
  location            = each.value.rglocation
  resource_group_name = each.value.rgname
}