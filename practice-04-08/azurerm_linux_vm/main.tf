resource "azurerm_network_interface" "linux_vm_nic" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = data.azurerm_network_interface.nic_block[each.key].location
  resource_group_name = data.azurerm_network_interface.nic_block[each.key].resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_network_interface.nic_block[each.key].subnet_id
    private_ip_address_allocation = data.azurerm_network_interface.nic_block[each.key].private_ip_address_allocation
    public_ip_address_id          = data.azurerm_network_interface.nic_block[each.key].public_ip_address_id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each            = var.vms
  name                = each.value.vm_name
  resource_group_name = data.azurerm_network_interface.nic_block[each.key].resource_group_name
  location            = data.azurerm_network_interface.nic_block[each.key].location
  size                = each.value.vm_size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    azurerm_network_interface.linux_vm_nic[each.key].id,
  ]

  os_disk {
    caching              = each.value.os_disk_caching
    storage_account_type = each.value.os_disk_storage_account_type
  }

  disable_password_authentication = each.value.disable_password_authentication

  source_image_reference {
    publisher = each.value.source_image_reference_publisher
    offer     = each.value.source_image_reference_offer
    sku       = each.value.source_image_reference_sku
    version   = each.value.source_image_reference_version
  }

}

