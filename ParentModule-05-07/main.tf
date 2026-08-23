module "resource_group" {
  source = "./child_modules/resource_groups"
  rgs    = var.resource_group
}

module "storage_acc" {
  source     = "./child_modules/storage_acc"
  depends_on = [module.resource_group]
  stgs       = var.storage_acc
}