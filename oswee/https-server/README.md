# Testing webserver

Build binary
`bazel build //oswee/server:binary`
Run the binary
`bazel run //oswee/server:binary -- -p :9443 -d /data`

To run it, a valid TLS certs should be placed in `~/.tls/oswee.com/` directory.
