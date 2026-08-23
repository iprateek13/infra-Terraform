nsgs = {
  nsg1 = {
    name        = "nsg1"
    nsglocation = "centralindia"
    rgname      = "rg1"

    security_rule = {
      name                       = "Allow-RDP"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  nsg2 = {
    name        = "nsg2"
    nsglocation = "centralindia"
    rgname      = "rg1"

    security_rule = {
      name                       = "Allow-HTTP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  nsg3 = {
    name        = "nsg3"
    nsglocation = "eastus"
    rgname      = "rg1"

    security_rule = {
      name                       = "Allow-SSH"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
  nsg4 = {
    name        = "nsg4"
    nsglocation = "eastus"
    rgname      = "rg1"

    security_rule = {
      name                       = "Allow-HTTPS"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

}