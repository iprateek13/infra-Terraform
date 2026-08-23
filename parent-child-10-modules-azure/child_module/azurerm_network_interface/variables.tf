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
  description = "Map of network interfaces to create"
}
