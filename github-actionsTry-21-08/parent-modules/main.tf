module "resource_group" {
  source          = "../child-modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storage_account" {
  source           = "../child-modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts

  depends_on = [module.resource_group]
}

module "vnet" {
  source   = "../child-modules/azurerm_vnet"
  networks = var.vnet

  depends_on = [module.resource_group]
}