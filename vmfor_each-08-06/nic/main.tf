resource "azurerm_network_interface" "example" {
    for_each = var.nics
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = each.value.ip_configuration.subnet_key
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
  }
}