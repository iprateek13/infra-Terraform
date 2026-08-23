resource "azurerm_resource_group" "rgss" {
    for_each = var.rgs
  name = each.key
  location = each.value
}