data "azurerm_network_interface" "nic_block" {
  for_each = var.windows_nics
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}