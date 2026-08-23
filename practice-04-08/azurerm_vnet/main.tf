resource "azurerm_virtual_network" "vnet_block" {
  for_each            = var.vnets
  name                = each.value.name
  location            = each.value.location
  resource_group_name = data.azurerm_resource_group.rg_block[each.key].name
  address_space       = each.value.address_space
}
