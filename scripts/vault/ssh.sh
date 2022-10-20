#!/bin/sh

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519 -C "dzintars@workstation"
vault write -field=signed_key ssh-client-signer/sign/clientrole public_key=@$HOME/.ssh/id_ed25519.pub > ~/.ssh/id_ed25519-cert.pub
