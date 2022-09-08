#!/bin/sh

echo "Choose the option:"
echo
echo "(d) Decrypt all Ansible vault files"
echo "(e) Encrypt all Ansible vault files"
read option

function decrypt {
  ansible-vault decrypt --ask-vault-pass \
  ansible/*/environments/development/group_vars/*/vault.yaml \
  ansible/*/environments/development/host_vars/*/vault.yaml
}

function encrypt {
  ansible-vault encrypt --ask-vault-pass \
  ansible/*/environments/development/group_vars/*/vault.yaml \
  ansible/*/environments/development/host_vars/*/vault.yaml
}

case $option in
  d)
    decrypt
    ;;
  e)
    encrypt
    break
    ;;
  *)
    echo "Wrong option"
    ;;
esac
