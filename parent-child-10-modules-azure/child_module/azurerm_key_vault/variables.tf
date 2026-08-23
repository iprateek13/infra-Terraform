variable "key_vaults" {
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    sku_name                   = string
    soft_delete_retention_days = number
    tags                       = map(string)
  }))
  description = "Map of Key Vaults to create"
}
