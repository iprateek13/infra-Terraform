module "resource_group" {
  source = "./modules/azurerm_resource_group"
  resource_groups = var.resource_groups
}

module "virtual_network" {
  source = "./modules/azurerm_virtual_network"
  vnets = var.vnets
}

module "subnet" {
  source = "./modules/azurerm_subnet"
  subnets = var.subnets
}

module "nsg" {
  source = "./modules/azurerm_nsg"
  nsgs = var.nsgs
}

module "nic" {
  source = "./modules/azurerm_nic"
  nics = var.nics
}

module "vm" {
  source = "./modules/azurerm_vm"
  vms = var.vms
}