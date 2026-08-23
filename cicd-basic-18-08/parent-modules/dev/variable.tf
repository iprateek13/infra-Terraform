variable "rgs" {
  description = "A map of resource groups to create"
  type        = map(object({
    name     = string
    location = string
  }))
}
variable "storage_account" {
  description = "A map of storage accounts to create"
  type        = map(object({
    name                         = string
    resource_group_name          = string
    location                     = string
    account_tier                 = string
    account_replication_type     = string
  }))  
}
variable "storage_container" {
  description = "A map of storage containers to create"
  type        = map(object({ name = string, storage_account_id = string, container_access_type = string }))
}