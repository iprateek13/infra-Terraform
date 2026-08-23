module "rg-module" {
  source = "../../child-modules/resource_groups"
  resource_groups = var.rgs
}
module "storage-account" {
  source = "../../child-modules/azurerm_storage_Acc"
  storage_account = var.storage_account
  depends_on = [module.rg-module]
}
module "storage-container" {
  source = "../../child-modules/azurerm_storage_container"
  storage_container = var.storage_container
  depends_on = [module.storage-account]
}   