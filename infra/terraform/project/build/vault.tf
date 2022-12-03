resource "vault_mount" "infra" {
  path        = "infra"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine mount"
}

# TODO: I need to create policy to read these secrets

resource "vault_kv_secret_v2" "buildkite" {
  mount               = vault_mount.infra.path
  name                = "buildkite"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      api_token    = var.buildkite.api_token
      organization = var.buildkite.organization
    }
  )
}

resource "vault_kv_secret_v2" "bat" {
  mount               = vault_mount.infra.path
  name                = "buildkite"
  cas                 = 1
  delete_all_versions = true
  data_json = jsonencode(
    {
      agent_token = buildkite_agent_token.oswee.token,
    }
  )
}
