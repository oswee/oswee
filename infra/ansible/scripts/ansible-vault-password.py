#!/usr/bin/env python

import os

passwd='secret-tool lookup ansible-vault oswee-password'
# passwd='keepassxc-cli show -q -s -a password /mnt/secrets/secrets/personal.kdbx -y 2:19622761 /Personal/Workstation/Ansible\ Vault\ Oswee'
os.system(passwd)
