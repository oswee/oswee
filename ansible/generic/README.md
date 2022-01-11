# Ansible Collection - oswee.generic

To test roles via Molecule run `mkdir -p ./collections/ansible_collections/oswee/generic/ && ln -s $PWD/roles $PWD/collections/ansible_collections/oswee/generic/`
from the `./ansible/generic/` directory. This will "loopback" to the current collection roles.
Not sure why any other conventional solutions doesn't work for local role testing without pinging the web.
