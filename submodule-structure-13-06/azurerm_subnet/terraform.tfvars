subnetss = {
  subnet1 = {
    name                 = "frontendsub"
    resource_group_name  = "testrg"
    virtual_network_name = "testvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "backendsub"
    resource_group_name  = "testrg"
    virtual_network_name = "testvnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}