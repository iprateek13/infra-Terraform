variable "reso_gr" {
  type = map(object({
    rg_name     = string
    rg_location = string
  manager = string }))
  description = "Enter rgname"
  # default = "mera-rg"
}

