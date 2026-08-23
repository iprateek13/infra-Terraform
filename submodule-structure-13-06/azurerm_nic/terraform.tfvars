nics = {
  nic1 = {
    name                = "front-nic"
    location            = "centralindia"
    resource_group_name = "testrg"

    ip_configuration = {
      name                          = "ip1subnet1"
      subnet_id                     = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/testrg/providers/Microsoft.Network/virtualNetworks/testvnet/subnets/backendsub"
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/testrg/providers/Microsoft.Network/publicIPAddresses/public-ip"

  } }
  nic2 = {
    name                = "back-nic"
    location            = "centralindia"
    resource_group_name = "testrg"

    ip_configuration = {
      name                          = "ip2subnet2"
      subnet_id                     = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/testrg/providers/Microsoft.Network/virtualNetworks/testvnet/subnets/frontendsub"
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id          = "/subscriptions/bdb89ac3-e42b-4f59-993e-7dde7e60d4e0/resourceGroups/testrg/providers/Microsoft.Network/publicIPAddresses/public-ip2",
    }
} }