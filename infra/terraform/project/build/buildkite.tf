resource "buildkite_agent_token" "oswee" {
  description = "Token used by build fleet (TF)"
}

resource "buildkite_pipeline" "oswee-release" {
  # TODO: These should be changed
  name       = "oswee"
  repository = "git@github.com:dzintars/oswee"
  steps      = data.local_file.release_step.content

  provider_settings {
    build_branches      = false
    build_tags          = true
    build_pull_requests = false
    trigger_mode        = "code"
  }
}
