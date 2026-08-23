# variable "rgname" {
#   type = map(object({ name = string
#     location = string
#   manager = string }))
# }
# variable "stgs" {
#   type = map(object({
#     stname     = string
#     stlocation = string
#     replica    = string
#     acc_tier   = string
#     rgname     = string
#     depend     = optional(string)
#     }
#     )
#   )
# }
# variable "cnts" {
#   type = map(object({ cntname = string
#     stg_id = string
#   con_type = string }))
# }

# -->
# variable "infrastructure" {
#   type = map(object({
    
#     # RG ka data
#     rg_name     = string
#     rg_location = string
#     rg_manager  = string

#     # Storage ka data
#     stg_name     = string
#     stg_location = string
#     replica      = string
#     acc_tier     = string

#     # Container ka data
#     cnt_name = string
#     con_type = string

#   }))
# }

# --> Above me problem kya aa skti hai 
# -->
# Agar ek RG mein storage nahi chahiye?
# Ya ek storage mein container nahi chahiye?

# Tab yeh approach thodi rigid ho jaati hai —
# kyunki har rg0/rg1 ke liye SABI cheezein
# define karni padegi!

# Solution: optional() use karo


variable "infrastructure" {
  type = map(object({
    rg_name     = string
    rg_location = string
    rg_manager  = string

    # Optional fields
    stg_name     = optional(string)
    stg_location = optional(string)
    replica      = optional(string)
    acc_tier     = optional(string)
    cnt_name     = optional(string)
    con_type     = optional(string)
  }))
}