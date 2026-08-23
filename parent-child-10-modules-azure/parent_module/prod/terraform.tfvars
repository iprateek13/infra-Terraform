# 1. Resource Groups (Demonstrating 2 RGs in Production)
resource_groups = {
  "rg-prod-core" = {
    name     = "rg-prod-core-eastus"
    location = "East US"
    tags     = { Environment = "Production", Owner = "DevOps" }
  },
  "rg-prod-app" = {
    name     = "rg-prod-app-eastus"
    location = "East US"
    tags     = { Environment = "Production", Owner = "AppTeam" }
  }
}

# 2. Storage Accounts
storage_accounts = {
  "st-prod" = {
    name                     = "stprodcoreeastus2026"
    resource_group_name      = "rg-prod-core-eastus"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
    tags                     = { Environment = "Production" }
  }
}

# 3. Virtual Networks
vnets = {
  "vnet-prod" = {
    name                = "vnet-prod-eastus"
    resource_group_name = "rg-prod-core-eastus"
    location            = "East US"
    address_space       = ["10.0.0.0/16"]
    tags                = { Environment = "Production" }
  }
}

# 4. Subnets
subnets = {
  "snet-prod-app" = {
    name                 = "snet-prod-app"
    resource_group_name  = "rg-prod-core-eastus"
    virtual_network_name = "vnet-prod-eastus"
    address_prefixes     = ["10.0.1.0/24"]
  }
}

# 5. Network Security Groups
nsgs = {
  "nsg-prod" = {
    name                = "nsg-prod-app"
    resource_group_name = "rg-prod-core-eastus"
    location            = "East US"
    security_rules = [
      {
        name                       = "Allow-HTTPS"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
    tags = { Environment = "Production" }
  }
}

# 6. Public IPs
public_ips = {
  "pip-prod" = {
    name                = "pip-prod-vm"
    resource_group_name = "rg-prod-core-eastus"
    location            = "East US"
    allocation_method   = "Static"
    sku                 = "Standard"
    tags                = { Environment = "Production" }
  }
}

# 7. Network Interfaces
nics = {
  "nic-prod" = {
    name                 = "nic-prod-vm"
    resource_group_name  = "rg-prod-core-eastus"
    location             = "East US"
    subnet_name          = "snet-prod-app"
    virtual_network_name = "vnet-prod-eastus"
    public_ip_name       = "pip-prod-vm"
    tags                 = { Environment = "Production" }
  }
}

# 8. Linux Virtual Machines
vms = {
  "vm-prod" = {
    name                = "vm-prod-app"
    resource_group_name = "rg-prod-core-eastus"
    location            = "East US"
    size                = "Standard_D2s_v3"
    admin_username      = "sysadmin"
    admin_password      = "ProdSecurePass2026!"
    nic_name            = "nic-prod-vm"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Premium_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    tags = { Environment = "Production" }
  }
}

# 9. Key Vaults
key_vaults = {
  "kv-prod" = {
    name                       = "kv-prod-eastus-2026"
    resource_group_name        = "rg-prod-core-eastus"
    location                   = "East US"
    sku_name                   = "premium"
    soft_delete_retention_days = 90
    tags                       = { Environment = "Production" }
  }
}

# 10. Log Analytics Workspaces
log_analytics_workspaces = {
  "law-prod" = {
    name                = "law-prod-eastus"
    resource_group_name = "rg-prod-core-eastus"
    location            = "East US"
    sku                 = "PerGB2018"
    retention_in_days   = 90
    tags                = { Environment = "Production" }
  }
}
