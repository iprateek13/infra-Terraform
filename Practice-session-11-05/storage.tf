resource "azurerm_storage_account" "storage_rg" {
  name = "azure_storage"
  resource_group_name = "azure_rg"
  account_replication_type="LRS"
  location = "central india"
  account_tier="Standard"
  depends_on = [ azurerm_resource_group.rg_name ]
}