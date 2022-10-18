module "network" {
  source       = "./modules/network"
  network_name = var.network_name
}

module "tls" {
  source = "./modules/tls"
}

module "storage" {
  source    = "./modules/storage"
  pool_name = "s3.oswee.dev"
  pool_path = "/mnt/data/libvirt"
}

module "minio" {
  source = "./modules/minio"
  fqdn   = "oswee.dev"
  volume = {
    name = "s3.oswee.dev"
    pool = module.storage.pool.name
  }
  cloudinit = {
    name = "s3.oswee.dev"
  }
  addresses = ["192.168.100.222/16"]
  gateway   = "192.168.254.254"
  vm = {
    domain   = "oswee.dev"
    hostname = "s3.oswee.dev"
    user     = "ansible"
  }
  domain = {
    name = "s3.oswee.dev"
  }
  network = {
    name = module.network.network
  }
}
