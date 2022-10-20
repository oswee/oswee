#cloud-config

fqdn: ${fqdn}
hostname: ${hostname}

timezone: ${time_zone}

packages:
  - qemu-guest-agent
  - jq
  - firewalld

write_files:
  %{ if ssh_host_cert }
  - content: |
      ${indent(6, ssh_host_cert_script)}
    path: /etc/vault/sign-host-cert.sh
    owner: "root:root"
    permissions: "0500"
  - content: |
      ${indent(6, ssh_host_cert_service)}
    path: /etc/systemd/system/sign-host-certificate.service
    owner: "root:root"
    permissions: "0644"
  - content: |
      ${indent(6, ssh_host_cert_timer)}
    path: /etc/systemd/system/sign-host-certificate.timer
    owner: "root:root"
    permissions: "0644"
  %{ endif }

runcmd:
  - [ systemctl, daemon-reload ]
  - [ systemctl, enable, qemu-guest-agent ]
  - [ systemctl, start, qemu-guest-agent ]

  %{ if ssh_host_cert }
  - [ curl, -o, /etc/ssh/trusted-user-ca-keys.pem, "${vault_address}/v1/ssh-client-signer/public_key" ]
  - [ chmod, 0600, /etc/ssh/trusted-user-ca-keys.pem ]
  - [ sed, -i, -e, "$aTrustedUserCAKeys /etc/ssh/trusted-user-ca-keys.pem", /etc/ssh/sshd_config ]
  - [ sed, -i, -e, "$aHostKey /etc/ssh/ssh_host_ed25519_key", /etc/ssh/sshd_config ]
  - [ sed, -i, -e, "$aHostCertificate /etc/ssh/ssh_host_ed25519_key-cert.pub", /etc/ssh/sshd_config ]
  - [ systemctl, restart, sshd.service ]
  - [ systemctl, enable, sign-host-certificate.timer ]
  - [ systemctl, start, sign-host-certificate.timer ]
  %{ endif }

users:
  - name: ${user}
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    groups: users, wheel
    shell: /bin/bash
    %{ if user_ssh_pub_key != "" }
    ssh_authorized_keys:
      - ${user_ssh_pub_key}
    %{ endif }

# TODO: For testing purposes enable TTY access. SHOULD BE REMOVED!
chpasswd:
  expire: false  # Request password change on login
  list:
    - ${user}:test

growpart:
  mode: auto
  devices: ['/']

resize_rootfs: true

final_message: "**** The system is up, after $UPTIME seconds ****"
