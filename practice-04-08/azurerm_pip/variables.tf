variable "pips" {
  type = map(object({
    nic_name            = string
    resource_group_name = string
    allocation_method   = string
    environment         = string
  }))
}