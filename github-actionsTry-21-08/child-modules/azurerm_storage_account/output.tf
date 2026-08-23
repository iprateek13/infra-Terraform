output "storage_account_ids" {
  value = {
    for key, storage in azurerm_storage_account.storage_account :
    key => storage.id
  }
}