resource "azurerm_storage_account" "example" {
    for_each                 = var.storage_accounts
  name                     = each.value.storage_account_name
  resource_group_name      =each.value.resource_group_name
  location                 = azurerm_resource_group.example.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type    

  tags = {
    environment = each.value.environment
  }
}
resource "azurerm_storage_container" "example" {
  for_each             = var.storage_containers
  name                  = each.value.storage_container_name
  storage_account_id    = 
  container_access_type = each.value.container_access_type
}