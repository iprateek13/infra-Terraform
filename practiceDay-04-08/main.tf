resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
  name     = "my-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "storage" {
    for_each = var.stgs
  name                     = each.value.name # Must be globally unique, lowercase alphanumeric
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 =  azurerm_resource_group.rg[each.key].location
  account_tier             = each.value.account_tier # "Standard" or "Premium"
  account_replication_type = each.value.account_replication_type # "LRS", "GRS", "RAGRS", "ZRS" # "Storage", "StorageV2", "BlobStorage", "FileStorage", "BlockBlobStorage"
}