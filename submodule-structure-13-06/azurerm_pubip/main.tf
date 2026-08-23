resource "azurerm_public_ip" "pubids" {
  for_each            = var.pubips
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = each.value.allocation_method
  sku = each.value.sku
}