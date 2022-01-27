env_name    = "prod"
env_layer   = "010dhcp"
global_fqdn = "oswee.com"

/* qemu_uri = "qemu:///system" */

domain = {
  name = "oswee.com"
}
cluster_name = "ocp"
autostart    = true

addresses = ["192.168.67.0/24"]

volume = {
  name = "test"
}

/* hostname = "bastion" */
/* network_config = { */
/*     hostIP = "192.168.122.254" */
/*     broadcast = "192.168.122.255" */
/*     dns = "192.168.1.1" */
/*     gateway = "192.168.1.1" */
/*     network= "192.168.1.0" */
/* } */
