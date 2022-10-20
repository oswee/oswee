*********************************
Vagrant driver installation guide
*********************************

Requirements
============

* Vagrant
* Virtualbox, Parallels, VMware Fusion, VMware Workstation or VMware Desktop

Install
=======

Please refer to the `Virtual environment`_ documentation for installation best
practices. If not using a virtual environment, please consider passing the
widely recommended `'--user' flag`_ when invoking ``pip``.

.. _Virtual environment: https://virtualenv.pypa.io/en/latest/
.. _'--user' flag: https://packaging.python.org/tutorials/installing-packages/#installing-to-the-user-site

.. code-block:: bash

    $ pip install 'molecule_vagrant'


ANSIBLE_COLLECTIONS_PATH=/home/dzintars/.cache/ansible-compat/4e9597/collections:
  /home/dzintars/.ansible/collections:
  /usr/share/ansible/collections 
ANSIBLE_CONFIG=./ansible.cfg
ANSIBLE_FILTER_PLUGINS=/home/dzintars/.local/lib/python3.10/site-packages/molecule/provisioner/ansible/plugins/filter:
  /home/dzintars/.cache/molecule/custom/dev/plugins/filter:
  /home/dzintars/code/github.com/dzintars/prime/ansible/custom/plugins/filter:
  /home/dzintars/.ansible/plugins/filter:
  /usr/share/ansible/plugins/filter 
ANSIBLE_FORCE_COLOR=True
ANSIBLE_LIBRARY=/home/dzintars/.cache/ansible-compat/4e9597/modules:
  /home/dzintars/.ansible/plugins/modules:
  /usr/share/ansible/plugins/modules:
  /home/dzintars/.local/lib/python3.10/site-packages/molecule/provisioner/ansible/plugins/modules:
  /home/dzintars/.local/lib/python3.10/site-packages/molecule_vagrant/modules:/home/dzintars/.cache/molecule/custom/dev/library:
  /home/dzintars/code/github.com/dzintars/prime/ansible/custom/library:
  /home/dzintars/.ansible/plugins/modules:
  /usr/share/ansible/plugins/modules 
ANSIBLE_ROLES_PATH=/home/dzintars/.cache/molecule/custom/dev/roles:
  /home/dzintars/code/github.com/dzintars/prime/ansible:
  /home/dzintars/.ansible/roles:
  /usr/share/ansible/roles:
  /etc/ansible/roles:
  /home/dzintars/.cache/ansible-compat/4e9597/roles:
  roles:
  /home/dzintars/.ansible/roles:
  /usr/share/ansible/roles:
  /etc/ansible/roles 
MOLECULE_DEBUG=True 
MOLECULE_DEPENDENCY_NAME=galaxy 
MOLECULE_DRIVER_NAME=vagrant 
MOLECULE_ENV_FILE=/home/dzintars/code/github.com/dzintars/prime/ansible/custom/.env.yml 
MOLECULE_EPHEMERAL_DIRECTORY=/home/dzintars/.cache/molecule/custom/dev 
MOLECULE_FILE=/home/dzintars/.cache/molecule/custom/dev/molecule.yml 
MOLECULE_INSTANCE_CONFIG=/home/dzintars/.cache/molecule/custom/dev/instance_config.yml 
MOLECULE_INVENTORY_FILE=/home/dzintars/.cache/molecule/custom/dev/inventory/ansible_inventory.yml 
MOLECULE_PROJECT_DIRECTORY=/home/dzintars/code/github.com/dzintars/prime/ansible/custom 
MOLECULE_PROVISIONER_NAME=ansible 
MOLECULE_SCENARIO_DIRECTORY=/home/dzintars/code/github.com/dzintars/prime/ansible/custom/molecule/dev 
MOLECULE_SCENARIO_NAME=dev MOLECULE_STATE_FILE=/home/dzintars/.cache/molecule/custom/dev/state.yml 
MOLECULE_VERIFIER_NAME=ansible 
MOLECULE_VERIFIER_TEST_DIRECTORY=/home/dzintars/code/github.com/dzintars/prime/ansible/custom/molecule/dev/tests
