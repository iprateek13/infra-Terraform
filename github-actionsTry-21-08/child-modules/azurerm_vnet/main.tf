resource "azurerm_virtual_network" "vnet" {
  for_each = var.networks

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space

  tags = each.value.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = var.networks

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet[each.key].name
  address_prefixes     = each.value.subnet_address_prefixes
}