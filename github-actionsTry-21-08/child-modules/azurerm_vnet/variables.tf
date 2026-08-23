variable "networks" {
  description = "A map of virtual networks to create"

  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    address_space              = list(string)
    subnet_name                = string
    subnet_address_prefixes   = list(string)
    tags                       = map(string)
  }))
}