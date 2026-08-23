resource "azurerm_resource_group" "dhondhu" {
  for_each = var.rgs
  name     = each.key   
  location = each.value 
}
