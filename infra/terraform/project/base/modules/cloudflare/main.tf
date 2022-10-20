terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

resource "cloudflare_zone" "root_zone" {
  account_id = var.cloudflare_account_id
  zone       = var.root_domain
  jump_start = true
}

resource "cloudflare_record" "root" {
  zone_id = cloudflare_zone.root_zone.id
  name    = "@"
  value   = var.public_ip_address
  type    = "A"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "acme_app" {
  zone_id = cloudflare_zone.root_zone.id
  name    = "_acme-challenge.app"
  value   = "cQYIP0KAQ8f0RqZGzbhxkyBav_gpxtKK0cnUmxDbHGw"
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "acme_wild" {
  zone_id = cloudflare_zone.root_zone.id
  name    = "_acme-challenge"
  value   = "tUKb0F1khfK3mMY5w8GJX8Wlu9cCPXDP9Ukpj3LqlvQ"
  type    = "TXT"
  ttl     = 1
  proxied = false
}

resource "cloudflare_record" "acme" {
  zone_id = cloudflare_zone.root_zone.id
  name    = "_acme-challenge"
  value   = "GHNzdkgd-Yaha73SUVCunOXyRhlgQvRX9VR1FvBMQUA"
  type    = "TXT"
  ttl     = 1
  proxied = false
}
