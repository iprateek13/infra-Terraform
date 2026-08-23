# 1. Resource Groups
resource_groups = {
  "rg-dev-1" = {
    name     = "rg-dev-eastus-01"
    location = "East US"
    tags     = { Environment = "Dev", ManagedBy = "Terraform" }
  },
  "rg-dev-2" = {
    name     = "rg-dev-eastus-02"
    location = "East US"
    tags     = { Environment = "Dev", ManagedBy = "Terraform" }
  }
}

# 2. Storage Accounts
storage_accounts = {
  "st-dev" = {
    name                     = "stdeveastus202601"
    resource_group_name      = "rg-dev-eastus-01"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags                     = { Environment = "Dev" }
  }
}

# 3. Virtual Networks
vnets = {
  "vnet-dev" = {
    name                = "vnet-dev-eastus"
    resource_group_name = "rg-dev-eastus-01"
    location            = "East US"
    address_space       = ["10.1.0.0/16"]
    tags                = { Environment = "Dev" }
  }
}

# 4. Subnets
subnets = {
  "snet-dev" = {
    name                 = "snet-dev-app"
    resource_group_name  = "rg-dev-eastus-01"
    virtual_network_name = "vnet-dev-eastus"
    address_prefixes     = ["10.1.1.0/24"]
  }
}

# 5. Network Security Groups
nsgs = {
  "nsg-dev" = {
    name                = "nsg-dev-app"
    resource_group_name = "rg-dev-eastus-01"
    location            = "East US"
    security_rules = [
      {
        name                       = "Allow-SSH"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = { Environment = "Dev" }
  }
}

# 6. Public IPs
public_ips = {
  "pip-dev" = {
    name                = "pip-dev-vm"
    resource_group_name = "rg-dev-eastus-01"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = { Environment = "Dev" }
  }
}

# 7. Network Interfaces
nics = {
  "nic-dev" = {
    name                 = "nic-dev-vm"
    resource_group_name  = "rg-dev-eastus-01"
    location             = "East US"
    subnet_name          = "snet-dev-app"
    virtual_network_name = "vnet-dev-eastus"
    public_ip_name       = "pip-dev-vm"
    tags                 = { Environment = "Dev" }
  }
}

# 8. Linux Virtual Machines
vms = {
  "vm-dev" = {
    name                = "vm-dev-app"
    resource_group_name = "rg-dev-eastus-01"
    location            = "East US"
    size                = "Standard_B1s"
    admin_username      = "azureuser"
    admin_password      = "DevPass123456!"
    nic_name            = "nic-dev-vm"
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
    tags = { Environment = "Dev" }
  }
}

# 9. Key Vaults
key_vaults = {
  "kv-dev" = {
    name                       = "kv-dev-eastus-2026"
    resource_group_name        = "rg-dev-eastus-01"
    location                   = "East US"
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    tags                       = { Environment = "Dev" }
  }
}

# 10. Log Analytics Workspaces
log_analytics_workspaces = {
  "law-dev" = {
    name                = "law-dev-eastus"
    resource_group_name = "rg-dev-eastus-01"
    location            = "East US"
    sku                 = "PerGB2018"
    retention_in_days   = 30
    tags                = { Environment = "Dev" }
  }
}
