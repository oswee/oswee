resource "cloudflare_record" "vault" {
  zone_id = data.terraform_remote_state.dns.outputs.root_zone_id
  name    = var.instance.hostname
  value   = var.public_ip_address
  type    = "A"
  ttl     = 1
  proxied = false
}
