resource "azurerm_resource_group" "rg_name" {
    for_each = var.azure_rg
    # for_each = toset([,east us"])
  name =each.key
  location = each.value
}

