# rgname = {
#   rg0 = {
#     name     = "merrabag"
#     location = "centralindia"
#     manager  = "mota"
#   }
#   rg1 = {
#     name     = "terrabag"
#     location = "eastus"
#     manager  = "motadevi"
#   }
#   rg2 = {
#     name     = "rgbag"
#     location = "centralindia"
#     manager  = "4kgloss"
#   }
# }
# stgs = {
#   rg0 = {
#     stname     = "motake"
#     acc_tier   = "Standard"
#     replica    = "LRS"
#     rgname     = "merrabag"
#     stlocation = "centralindia"
#   }
#   rg1 = {
#     stname     = "motakastrorage"
#     acc_tier   = "Standard"
#     replica    = "LRS"
#     rgname     = "terrabag"
#     stlocation = "eastus"
#   }
#   rg2 = {
#     stname     = "motafulfill"
#     acc_tier   = "Standard"
#     replica    = "LRS"
#     rgname     = "rgbag"
#     stlocation = "centralindia"
#   }
# }
# cnts = {
#   rg0 = {
#     cntname  = "container1"
#     stg_id   = "motake"
#     con_type = "private"
#   }
#   rg1 = {
#     cntname  = "container1"
#     stg_id   = "motake"
#     con_type = "private"
#   }
#   rg1 = {
#     cntname  = "container1"
#     stg_id   = "motake"
#     con_type = "private"
#   }
# }

infrastructure = {
  rg0 = {
    # RG
    rg_name     = "merrabag"
    rg_location = "centralindia"
    rg_manager  = "mota"

    # Storage
    stg_name     = "motake"
    stg_location = "centralindia"
    replica      = "LRS"
    acc_tier     = "Standard"

    # Container
    cnt_name = "container1"
    con_type = "private"
  }

  rg1 = {
    # RG
    rg_name     = "terrabag"
    rg_location = "eastus"
    rg_manager  = "motadevi"

    # Storage
    stg_name     = "motakastrorage"
    stg_location = "eastus"
    replica      = "LRS"
    acc_tier     = "Standard"

    # Container
    cnt_name = "container2"
    con_type = "private"
  }
  rg3= {
    # RG
    rg_name     = "bagji"
    rg_location = "centralindia"
    rg_manager  = "motadevikibag"

    # # Storage
    # stg_name     = "motakastrorage"
    # stg_location = "eastus"
    # replica      = "LRS"
    # acc_tier     = "Standard"

    # # Container
    # cnt_name = "container2"
    # con_type = "private"
  }
}

