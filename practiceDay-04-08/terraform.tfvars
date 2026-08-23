rgs={
    rg1={
        name="my-resource-group"
        location="East US"
    }
    rg2={
        name="my-resource-group-2"
        location="West US"
    }
}
stgs={
    stg1={
      name="mystorageaccount1"
      account_tier="Standard"   
    account_replication_type="LRS"
    account_kind="StorageV2"

    }
    stg2={
        name="mystorageaccount2"
        account_tier="Premium"
        account_replication_type="GRS"
        account_kind="StorageV2"
    }
}