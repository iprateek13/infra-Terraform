data "azurerm_resource_group" "rg_data" {
  for_each = var.vnets
  name=each.value.resource_group_name
  }


