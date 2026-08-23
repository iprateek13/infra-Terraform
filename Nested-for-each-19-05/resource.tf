resource "azurerm_resource_group" "rg" {
  for_each   = var.reso_gr
  name       = each.value.rg_name
  location   = each.value.rg_location
  managed_by = each.value.manager
}