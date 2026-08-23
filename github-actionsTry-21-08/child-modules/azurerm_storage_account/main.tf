resource "azurerm_storage_account" "storage_account" {
  for_each = var.storage_accounts

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  https_traffic_only_enabled      = true
  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false
  public_network_access_enabled   = false
  shared_access_key_enabled       = false

  blob_properties {
    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }

  tags = each.value.tags
}