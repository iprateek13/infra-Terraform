data "azurerm_storage_account" "example" {
  for_each            = var.storage_account
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
