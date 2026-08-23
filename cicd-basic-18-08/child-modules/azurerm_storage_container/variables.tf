variable "storage_container" {
  type = map(object({ name = string, storage_account_id = string, container_access_type = strin }))
}
