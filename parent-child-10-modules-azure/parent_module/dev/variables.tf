# 1. Resource Groups
variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

# 2. Storage Accounts
variable "storage_accounts" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}

# 3. Virtual Networks
variable "vnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

# 4. Subnets
variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

# 5. Network Security Groups
variable "nsgs" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
    tags = map(string)
  }))
}

# 6. Public IPs
variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))
}

# 7. Network Interfaces
variable "nics" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    subnet_name          = string
    virtual_network_name = string
    public_ip_name       = string
    tags                 = map(string)
  }))
}

# 8. Linux Virtual Machines
variable "vms" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_name            = string
    os_disk = object({
      caching              = string
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    tags = map(string)
  }))
}

# 9. Key Vaults
variable "key_vaults" {
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    sku_name                   = string
    soft_delete_retention_days = number
    tags                       = map(string)
  }))
}

# 10. Log Analytics Workspaces
variable "log_analytics_workspaces" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    retention_in_days   = number
    tags                = map(string)
  }))
}
