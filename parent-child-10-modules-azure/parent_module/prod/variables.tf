variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

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

variable "vnets" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)
    tags                = map(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

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
