[Unit]
Description=Sign a new host cert on boot, then daily
[Service]
ExecStart=/bin/sh /etc/vault/sign-host-cert.sh
Restart=on-failure
RestartSec=20
Type=forking
