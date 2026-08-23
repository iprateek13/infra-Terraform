resource_group = {
  rg1 = {
    name       = "merarg"
    location   = "central india"
    managed_by = "prateek"
  }
  rg1 = {
    name       = "merahai"
    location   = "central india"
    managed_by = "prateekji"
} }
storage_acc = {
  stg1 = {
    name                     = "stgrukjao"
    resource_group_name      = "merarg"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "staging"
    }
  }
  stg1 = {
    name                     = "stgbskro"
    resource_group_name      = "merahai"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "staging"
    }
  }
}