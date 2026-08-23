# 1. Resource Groups
resource_groups = {
  "rg-test" = {
    name     = "rg-test-eastus-01"
    location = "East US"
    tags     = { Environment = "Testing" }
  }
}

# 2. Storage Accounts
storage_accounts = {
  "st-test" = {
    name                     = "sttesteastus202601"
    resource_group_name      = "rg-test-eastus-01"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags                     = { Environment = "Testing" }
  }
}

# 3. Virtual Networks
vnets = {
  "vnet-test" = {
    name                = "vnet-test-eastus"
    resource_group_name = "rg-test-eastus-01"
    location            = "East US"
    address_space       = ["10.2.0.0/16"]
    tags                = { Environment = "Testing" }
  }
}

# 4. Subnets
subnets = {
  "snet-test" = {
    name                 = "snet-test-qa"
    resource_group_name  = "rg-test-eastus-01"
    virtual_network_name = "vnet-test-eastus"
    address_prefixes     = ["10.2.1.0/24"]
  }
}

# 5. Network Security Groups
nsgs = {
  "nsg-test" = {
    name                = "nsg-test-qa"
    resource_group_name = "rg-test-eastus-01"
    location            = "East US"
    security_rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = { Environment = "Testing" }
  }
}

# 6. Public IPs
public_ips = {
  "pip-test" = {
    name                = "pip-test-vm"
    resource_group_name = "rg-test-eastus-01"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = { Environment = "Testing" }
  }
}

# 7. Network Interfaces
nics = {
  "nic-test" = {
    name                 = "nic-test-vm"
    resource_group_name  = "rg-test-eastus-01"
    location             = "East US"
    subnet_name          = "snet-test-qa"
    virtual_network_name = "vnet-test-eastus"
    public_ip_name       = "pip-test-vm"
    tags                 = { Environment = "Testing" }
  }
}

# 8. Linux Virtual Machines
vms = {
  "vm-test" = {
    name                = "vm-test-qa"
    resource_group_name = "rg-test-eastus-01"
    location            = "East US"
    size                = "Standard_B1s"
    admin_username      = "testuser"
    admin_password      = "TestPass123456!"
    nic_name            = "nic-test-vm"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    tags = { Environment = "Testing" }
  }
}

# 9. Key Vaults
key_vaults = {
  "kv-test" = {
    name                       = "kv-test-eastus-2026"
    resource_group_name        = "rg-test-eastus-01"
    location                   = "East US"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    tags                       = { Environment = "Testing" }
  }
}

# 10. Log Analytics Workspaces
log_analytics_workspaces = {
  "law-test" = {
    name                = "law-test-eastus"
    resource_group_name = "rg-test-eastus-01"
    location            = "East US"
    sku                 = "PerGB2018"
    retention_in_days   = 30
    tags                = { Environment = "Testing" }
  }
}
