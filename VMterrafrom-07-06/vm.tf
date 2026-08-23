provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgss" {
  name     = "example-resources"
  location = "central india"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-sample"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rgss.location
  resource_group_name = azurerm_resource_group.rgss.name
}

resource "azurerm_subnet" "vsubnet" {
  name                 = "internal-subnet"
  resource_group_name  = azurerm_resource_group.rgss.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
resource "azurerm_public_ip" "pipid" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.rgss.name
  location            = azurerm_resource_group.rgss.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_security_group" "windows_nsg" {
  name                = "win-vm-nsg"
  location            = azurerm_resource_group.rgss.location
  resource_group_name = azurerm_resource_group.rgss.name
}
resource "azurerm_network_security_rule" "allow_rdp" {
  name                        = "AllowRDP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*" # For better security, replace "*" with your specific client IP
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rgss.name
  network_security_group_name = azurerm_network_security_group.windows_nsg.name
}

resource "azurerm_network_interface" "nics" {
  name                = "example-nic"
  location            = azurerm_resource_group.rgss.location
  resource_group_name = azurerm_resource_group.rgss.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vsubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.pipid.id
  }
}

resource "azurerm_windows_virtual_machine" "vms" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.rgss.name
  location            = azurerm_resource_group.rgss.location

  size = "Standard_B2s"

  admin_username = "adminuser"
  admin_password = "Prateek@1234"

  network_interface_ids = [
    azurerm_network_interface.nics.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }
}