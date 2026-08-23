subnets = {
  subnet1 = {
    subnet_name                 = "subnet1"
    resource_group_name  = "rg-mono"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name                 = "subnet2"
    resource_group_name  = "rg-mono"
    virtual_network_name = "vnet2"
    address_prefixes     = ["10.0.2.0/24"]
  }
  subnet3 = {
    subnet_name                 = "subnet3"
    resource_group_name  = "rg-mono"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.3.0/24"]
  }
}
