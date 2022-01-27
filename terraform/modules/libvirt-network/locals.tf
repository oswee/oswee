locals {
  network = defaults(var.network, {
    name = terraform.workspace
  })
}

# locals {
#   network = defaults(var.network, {
#     name      = terraform.workspace
#     mode      = "nat"
#     domain    =  "oswee.com"
#     addresses = "192.168.67.0/24"
#     autostart = true
#     dhcp      = {
#       enabled = true
#     }
#     dns = {
#       enabled = true
#     }
#   })
# }
