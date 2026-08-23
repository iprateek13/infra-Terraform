# Data block to fetch current Azure Client/Tenant context
data "azurerm_client_config" "current" {}

# Data block to fetch Azure Subscription details
data "azurerm_subscription" "primary" {}
