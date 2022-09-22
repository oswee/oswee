# Refference: https://github.com/ractf/infrastructure/blob/5f27d496bc398abc4c61192d87ab30f0b1fecc8f/modules/support/dns/main.tf

# resource "cloudflare_zone" "oswee-dev-domain" {
#   zone = var.domain
# }

resource "cloudflare_record" "gitlab" {
  zone_id = "e03dae9c5cce62675e7354ec90808c09"
  # count   = var.gitlab_frontend != "" ? 1 : 0
  name    = "gitlab"
  # value   = var.gitlab_frontend
  value   = "84.237.229.145"
  type    = "A"
  ttl     = 1
  proxied = false
}
