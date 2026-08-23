module "resource_group" {
  source          = "../../child_module/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "storage_account" {
  depends_on       = [module.resource_group]
  source           = "../../child_module/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_virtual_network"
  vnets      = var.vnets
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../child_module/azurerm_subnet"
  subnets    = var.subnets
}

module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_network_security_group"
  nsgs       = var.nsgs
}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_public_ip"
  public_ips = var.public_ips
}

module "network_interface" {
  depends_on = [module.subnet, module.public_ip]
  source     = "../../child_module/azurerm_network_interface"
  nics       = var.nics
}

module "linux_virtual_machine" {
  depends_on = [module.network_interface, module.storage_account]
  source     = "../../child_module/azurerm_linux_virtual_machine"
  vms        = var.vms
}

module "key_vault" {
  depends_on = [module.resource_group]
  source     = "../../child_module/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "log_analytics_workspace" {
  depends_on               = [module.resource_group]
  source                   = "../../child_module/azurerm_log_analytics_workspace"
  log_analytics_workspaces = var.log_analytics_workspaces
}
