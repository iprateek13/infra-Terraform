resource_groups = {
  "rgs1" = {
    name     = "resource_group_1"
    location = "West Europe"
  }
}

storage_accounts = {
  "storage_account_1" = {
    name                     = "merahaiyestorage"
    resource_group_name      = "resource_group_1"
    location                 = "West Europe"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags = {
      environment = "staging"
    }
  }
}
vnet = {
  "vnet1" = {
    name                    = "vnet1"
    resource_group_name     = "resource_group_1"
    location                = "West Europe"
    address_space           = ["10.0.0.0/16"]
    subnet_name             = "subnet1"
    subnet_address_prefixes = ["10.0.1.0/24"]
    tags = {
      environment = "staging"
      project     = "staging"
    }
  }
}
