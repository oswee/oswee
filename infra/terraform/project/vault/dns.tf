resource "cloudflare_record" "vault" {
  zone_id = var.cloudflare_root_zone_id
  name    = var.hostname
  value   = var.public_ip_address
  type    = "A"
  ttl     = 1
  proxied = false
}
