resource "azurerm_public_ip" "pips_block" {
  for_each            = var.pips
  name                = each.value.nic_name
  resource_group_name = data.azurerm_resource_group.rg_data[each.key].name
  location            = data.azurerm_resource_group.rg_data[each.key].location
  allocation_method   = each.value.allocation_method

  tags = {
    environment = each.value.environment
  }
}
