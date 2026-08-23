variable "resource_groups" {
  description = "A map of resource groups to create"
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_accounts" {
  description = "A map of storage accounts to create"
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
  }))
}
variable "vnet" {
  description = "A map of vnets to create"
  type = map(object({
    name                    = string
    resource_group_name     = string
    location                = string
    address_space           = list(string)
    subnet_name             = string
    subnet_address_prefixes = list(string)
    tags                    = map(string)
  }))
}
