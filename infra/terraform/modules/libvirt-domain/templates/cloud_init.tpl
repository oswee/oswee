#cloud-config

fqdn: ${hostname}.${domain}
hostname: ${hostname}

packages:
  - qemu-guest-agent
  - jq
  - firewalld

write_files:
  - content: |
      #!/bin/sh
      set -eu -o pipefail
      token_path=/root/.vault-token
      ssh_pub_key_path=/etc/ssh/ssh_host_ed25519_key.pub
      ssh_cert_path=/etc/ssh/ssh_host_ed25519_key-cert.pub
      echo "Authenticating with Vault"
      curl -sS \
        -X POST \
        -d @- "${vault_address}/v1/auth/approle/login" <<-EOF | jq -r '.auth.client_token' > $token_path
      {
        "role_id": "${vault_role_id}",
        "secret_id": "${vault_secret_id}"
      }
      EOF
      echo "Successfully authenticated with Vault"
      echo "Signing host certificate"
      curl -sS \
        -H "X-Vault-Token: $(cat $token_path)" \
        -X POST \
        -d @- "${vault_address}/v1/ssh-host-signer/sign/hostrole" <<-EOF | jq -r .data.signed_key > $ssh_cert_path
      {
        "public_key": "$(cat $ssh_pub_key_path)",
        "cert_type": "host"
      }
      EOF
      chmod 0640 $ssh_cert_path
      echo "Successfully signed ssh host certificate!"
    path: /etc/vault/sign-host-cert.sh
    permissions: '0500'
    owner: root:root
  - content: |
      [Unit]
      Description=Sign a new host cert on boot, then daily
      [Service]
      ExecStart=/bin/sh /etc/vault/sign-host-cert.sh
      Restart=on-failure
      RestartSec=20
      Type=forking
    path: /etc/systemd/system/sign-host-certificate.service
    permissions: '0644'
    owner: root:root
  - content: |
      [Unit]
      Description=Sign a new host cert on boot, then daily
      [Timer]
      OnCalendar=daily
      Persistent=true
      Unit=sign-host-certificate.service
      [Install]
      WantedBy=timers.target
    path: /etc/systemd/system/sign-host-certificate.timer
    permissions: '0644'
    owner: root:root

runcmd:
  - [ systemctl, daemon-reload ]
  - [ systemctl, enable, qemu-guest-agent ]
  - [ systemctl, start, qemu-guest-agent ]
  - [ curl, -o, /etc/ssh/trusted-user-ca-keys.pem, "${vault_address}/v1/ssh-client-signer/public_key" ]
  - [ chmod, 0600, /etc/ssh/trusted-user-ca-keys.pem ]
  - [ sed, -i, -e, "$aTrustedUserCAKeys /etc/ssh/trusted-user-ca-keys.pem", /etc/ssh/sshd_config ]
  - [ sed, -i, -e, "$aHostKey /etc/ssh/ssh_host_ed25519_key", /etc/ssh/sshd_config ]
  - [ sed, -i, -e, "$aHostCertificate /etc/ssh/ssh_host_ed25519_key-cert.pub", /etc/ssh/sshd_config ]
  - [ systemctl, restart, sshd.service ]
  - [ systemctl, enable, sign-host-certificate.timer ]
  - [ systemctl, start, sign-host-certificate.timer ]

users:
  - name: ${user}
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: users, wheel
    shell: /bin/bash
# TODO: If host certificates are used, then ssh key is not required and can be removed.
    %{ if user_ssh_pub_key != "" }
    ssh-authorized-keys:
      - ${user_ssh_pub_key}
    %{ endif }
#     lock_passwd: false
#     passwd: $6$J.GyJJBeV05c7FkF$Y2poMCgFMT.kgQpkMaraj70idTEOSlZJKXApUs9eoYnANJB.s326Co6C3s7qhVevOXtMDOAuQ3TX2TjORAQSi. #"pass"
#     ssh_import_id:

ssh_deletekeys: true

# TODO: For testing purposes only! Root access should be removed!
ssh_pwauth: true
chpasswd:
  list: |
     root:root
  expire: false

growpart:
  mode: auto
  devices: ['/']

resize_rootfs: true

timezone: ${time_zone}

final_message: "**** The system is up, after $UPTIME seconds ****"
