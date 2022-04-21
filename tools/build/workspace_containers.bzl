"""
Prime container base images
"""

# buildifier: disable=load-on-top
load("@io_bazel_rules_docker//container:container.bzl", "container_pull")

def prime_containers():
  """Imports container base images

  """
  container_pull(
      name = "com_google_distroless_base",
      digest = "sha256:7fa7445dfbebae4f4b7ab0e6ef99276e96075ae42584af6286ba080750d6dfe5",
      registry = "gcr.io",
      repository = "distroless/base",
  )

  container_pull(
      name = "com_google_distroless_base_debug",
      digest = "sha256:e12ba6be36761fd29e7c3beae66fc4e3a4a28652d0076bb9964274569f8e8a26",
      registry = "gcr.io",
      repository = "distroless/base",
  )

  container_pull(
      name = "com_google_distroless_base_arm64",
      digest = "sha256:c60be29941a0be6f748c8cf2e42832f95e9b73276042d3c44212af7cf4a152c9",
      registry = "gcr.io",
      repository = "distroless/base",
  )

  container_pull(
      name = "golang_container_1.17",
      digest = "sha256:c5d9a9078164b8255ff1833e59451d9ff59a5f9d30ac12d41aa4783e9d025643",
      registry = "index.docker.io",
      repository = "library/golang",
  )

