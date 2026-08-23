resource "azurerm_resource_group" "rgs" {
  for_each   = var.rgss
  name       = each.value.name
  location   = each.value.location
  managed_by = each.value.manager
}