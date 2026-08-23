rgs={
    "rg1" = {
        name     = "example-resources"
        location = "West Europe"
    }
}
storage_account={
    "sa1" = {
        name                     = "examplestoracc"
        resource_group_name      = "example-resources"
        location                 = "West Europe"
        account_tier             = "Standard"
        account_replication_type = "LRS"
    }
}
storage_container={
    "sc1" = {
        name                  = "tfstate"
        storage_account_id    = ""
        container_access_type = "private"
    }
}