# resource "azurerm_resource_group" "rggroups" {
#   for_each = var.rgname
#   # for_each=toset(var.location)
#   name       = each.value.name
#   location   = each.value.location
#   managed_by = each.value.manager
# }
# resource "azurerm_storage_account" "stgggss" {
#   # depends_on = [
#   #   azurerm_resource_group.rggroups
#   # ]
#   for_each                 = var.stgs
#   name                     = each.value.stname
#   location                 = each.value.stlocation
#   resource_group_name      = azurerm_resource_group.rggroups[each.key].name
#   account_replication_type = each.value.replica
#   account_tier             = each.value.acc_tier
# }
# resource "azurerm_storage_container" "cntss" {
#   for_each              = var.cnts
#   name                  = each.value.cntname
#   storage_account_id    = azurerm_storage_account.stgggss[each.key].id
#   container_access_type = each.value.con_type
# }


# RG
resource "azurerm_resource_group" "rggroups" {
  for_each   = var.infrastructure

  name       = each.value.rg_name
  location   = each.value.rg_location
  managed_by = each.value.rg_manager
}

# Storage Account
resource "azurerm_storage_account" "stgggss" {
  for_each = var.infrastructure

  name                     = each.value.stg_name
  location                 = each.value.stg_location
  resource_group_name      = azurerm_resource_group.rggroups[each.key].name
  account_replication_type = each.value.replica
  account_tier             = each.value.acc_tier
}

# Container
resource "azurerm_storage_container" "cntss" {
 for_each = {                              # ← Curly brace = naya MAP banana hai
  for k, v in var.infrastructure :   # ← Loop
  k => v                             # ← Output kya banega
  if v.stg_name != null              # ← Filter condition
}

  name                  = each.value.cnt_name
  storage_account_id    = azurerm_storage_account.stgggss[each.key].id
  container_access_type = each.value.con_type
}