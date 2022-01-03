# Ansible Collection - oswee.core

To test roles via Molecule run `mkdir -p ./collections/ansible_collections/oswee/core/ && ln -s $PWD/roles $PWD/collections/ansible_collections/oswee/core/`
from the `./ansible/core/` directory. This will "loopback" to the current collection roles.
Not sure why any other conventional solutions doesn't work for local role testing without pinging the web.
