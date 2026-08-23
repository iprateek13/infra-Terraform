resource_groups = {

  rg1 = {
    name     = "dev-rg"
    location = "Central India"
  }

  rg2 = {
    name     = "prod-rg"
    location = "Central India"
  }

}
vnets = {

  vnet1 = {

    name                = "dev-vnet"
    location            = "Central India"
    resource_group_name = "dev-rg"

    address_space = [
      "10.0.0.0/16"
    ]
  }

  vnet2 = {

    name                = "prod-vnet"
    location            = "Central India"
    resource_group_name = "prod-rg"

    address_space = [
      "20.0.0.0/16"
    ]
  }

}
subnets = {

  subnet1 = {

    name                 = "web-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"

    address_prefixes = [
      "10.0.1.0/24"
    ]
  }

  subnet2 = {

    name                 = "app-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"

    address_prefixes = [
      "10.0.2.0/24"
    ]
  }

  subnet3 = {

    name                 = "db-subnet"
    resource_group_name  = "dev-rg"
    virtual_network_name = "dev-vnet"

    address_prefixes = [
      "10.0.3.0/24"
    ]
  }

  subnet4 = {

    name                 = "web-subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"

    address_prefixes = [
      "20.0.1.0/24"
    ]
  }

  subnet5 = {

    name                 = "app-subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"

    address_prefixes = [
      "20.0.2.0/24"
    ]
  }

  subnet6 = {

    name                 = "db-subnet"
    resource_group_name  = "prod-rg"
    virtual_network_name = "prod-vnet"

    address_prefixes = [
      "20.0.3.0/24"
    ]
  }

}
nsgs = {

  nsg1 = {

    name                = "dev-nsg"
    location            = "Central India"
    resource_group_name = "dev-rg"
  }

  nsg2 = {

    name                = "prod-nsg"
    location            = "Central India"
    resource_group_name = "prod-rg"
  }

}
 nics={

    nic1 = {
      name                = "dev-nic"
      location            = "Central India"
      resource_group_name = "dev-rg"
      ip_config_name      = "internal"

      subnet_id = module.subnet.subnet_ids["subnet1"].id
    }

    nic2 = {
      name                = "prod-nic"
      location            = "Central India"
      resource_group_name = "prod-rg"
      ip_config_name      = "internal"

      subnet_id = module.subnet.subnet_ids["subnet4"].id
    }

  }
 vms = {

    vm1 = {

      name                = "dev-vm"
      resource_group_name = "dev-rg"
      location            = "Central India"

      size = "Standard_B1s"

      admin_username = "azureuser"
      admin_password = "Password@123456"

      nic_id = module.nic.nic_ids["nic1"].id
    }

    vm2 = {

      name                = "prod-vm"
      resource_group_name = "prod-rg"
      location            = "Central India"

      size = "Standard_B1s"

      admin_username = "azureuser"
      admin_password = "Password@123456"

      nic_id = module.nic.nic_ids["nic2"].id
    }

  }