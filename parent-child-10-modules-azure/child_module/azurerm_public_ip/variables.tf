variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
    tags                = map(string)
  }))
  description = "Map of public IPs to create"
}
