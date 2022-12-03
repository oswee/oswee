# TODO: DNS should be in this module because Vault.admin plan will ping the URL.
resource "cloudflare_record" "build" {
  zone_id = var.cloudflare_zone_id
  name    = var.instance.hostname
  value   = var.public_ip_address
  type    = "A"
  ttl     = 1
  proxied = false
}
