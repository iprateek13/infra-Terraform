data "azurerm_resource_group" "rg_data" {
    for_each = var.subnets
    name = each.value.resource_group_name
}

# output "id" {
#   value = data.azurerm_resource_group.example.id
# }