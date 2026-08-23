data "azurerm_resource_group" "rg_block" {
for_each = var.vnets
  name =each.value.resource_group_name
}

# output "id" {
#   value = data.azurerm_resource_group.rg_block[each.key].id
# }