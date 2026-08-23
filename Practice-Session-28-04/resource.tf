resource "azurerm_resource_group" "exam1" {
  for_each = var.rgs
  name=each.key
  location = each.value
  managed_by = "azurermprateek"
}
