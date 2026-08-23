nics = {
  nic1 = {
    nic_name            = "example-nic"
    ip_name             = "internal"
    resource_group_name = "rg-mono"
  }
}
vms={
    vm1={
      vm_name = "example-vm"
      vm_size = "Standard_B1s"
      admin_username = "adminuser"
      admin_password = "P@ssw0rd1234!"
      os_disk_caching = "ReadWrite"
      os_disk_storage_account_type = "Standard_LRS"
      disable_password_authentication = false
      source_image_reference_publisher = "Canonical"
      source_image_reference_offer = "UbuntuServer"
      source_image_reference_sku = "18.04-LTS"
      source_image_reference_version = "latest"   
    }
}
