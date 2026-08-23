variable "vms" {
  type = map(object({
    vm_name                            = string
    vm_size                            = string
    admin_username                     = string
    admin_password                     = string
    os_disk_caching                    = string
    os_disk_storage_account_type       = string
    disable_password_authentication     = bool
    source_image_reference_publisher   = string
    source_image_reference_offer       = string
    source_image_reference_sku         = string
    source_image_reference_version     = string
  }))
}

variable "nics" {
  type = map(object({
    nic_name            = string
    ip_name             = string
    resource_group_name = string
  }))
}