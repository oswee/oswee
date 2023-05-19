# Gerrit Code Review

Copy built version of OAUTH plugin

```bash
chmod 0600 ~/code/gerrit.googlesource.com/plugins/oauth/bazel-bin/oauth.jar
podman cp ~/code/gerrit.googlesource.com/plugins/oauth/bazel-bin/oauth.jar cix-pod-gerrit:/var/gerrit/plugins/
```

```bash
podman kube play deployment.yaml

podman exec -u 0 -it cix-pod-gerrit /bin/bash
podman container restart cix-pod-gerrit
```

Copy config file

```bash
podman cp gerrit.config cix-pod-gerrit:/var/gerrit/etc/
```

Some config reference

```
[httpd]
        listenUrl = proxy-https://127.0.0.1:8080
        filterClass = com.googlesource.gerrit.plugins.ootb.FirstTimeRedirect
        firstTimeRedirectUrl = /login/%23%2F?account_id=1000000
[container]
        javaOptions = "-Dflogger.backend_factory=com.google.common.flogger.backend.log4j.Log4jBackendFactory#getInstance"
        javaOptions = "-Dflogger.logging_context=com.google.gerrit.server.logging.LoggingContext#getInstance"
        user = gerrit
        javaHome = /usr/lib/jvm/java-11-openjdk-11.0.18.0.10-2.el8_7.x86_64
        javaOptions = -Djava.security.egd=file:/dev/./urandom
        javaOptions = --add-opens java.base/java.net=ALL-UNNAMED
        javaOptions = --add-opens java.base/java.lang.invoke=ALL-UNNAMED
[database]
        type = mysql
        hostname = localhost
        database = gerritdb
        username = gerrit
        password = gerritsecret
[plugin "verify-status"]
        dbType = mysql
        database = cidata
        username = gerrit
        password = gerritsecret
        hostname = localhost
```