variable "log_analytics_workspaces" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    sku                 = string
    retention_in_days   = number
    tags                = map(string)
  }))
  description = "Map of Log Analytics Workspaces to create"
}
