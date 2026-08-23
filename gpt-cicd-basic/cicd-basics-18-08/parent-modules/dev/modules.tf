module "resource_group" {
  source = "../../child-modules/resource_groups"

  resource_group_name = var.resource_group_name
  location             = var.location
  tags                 = var.tags
}

module "storage_account" {
  source = "../../child-modules/azurerm_storage_acc"

  storage_account_name = var.storage_account_name
  resource_group_name  = module.resource_group.resource_group_name
  location             = var.location
  container_name       = var.container_name
  tags                 = var.tags
}
