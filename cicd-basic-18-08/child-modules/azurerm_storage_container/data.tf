
data "azurerm_storage_container" "datacontainer" {
  for_each              = var.storage_container
  name                  = each.value.name
  storage_account_id    = data.azurerm_storage_container.datacontainer[each.value.storage_account_id].id
  container_access_type = each.value.container_access_type
}
