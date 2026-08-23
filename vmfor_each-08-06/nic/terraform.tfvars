nics = {

  nic1 = {
name="interface1"
    location            = "centralindia"
    resource_group_name = "indiarg"

    ip_configuration = {
      name                          = "internal"
      subnet_key                    = "net1sub1"
      private_ip_address_allocation = "Dynamic"
    
    }
  }

  nic2 = {
name="interface2"
    location            = "centralindia"
    resource_group_name = "indiarg"

    ip_configuration = {
      name                          = "internal"
      subnet_key                    = "net1sub2"
      private_ip_address_allocation = "Dynamic"
    }
  }
}