# Vagrant

This role "should" setup Vagrant for KVM with vagrant-libvirt plugin.
It is not finished, because there is some upstream issues related to Fedora setup.

## Requirements

Follow instructions from this [issue](https://github.com/hashicorp/vagrant/issues/11020#issuecomment-974222044)
But be aware that those instructions will install older version of Vagrant than available in upstream.
Another (issue)[https://github.com/vagrant-libvirt/vagrant-libvirt/issues/1031#issuecomment-517578903]

## Role Variables

Visit `./defaults/main.yml` file.

## Dependencies

See the `./meta/main.yml` for up-to-date list.

- role: oswee.core.libvirt

## Example Playbook

- hosts: servers
  roles:
  - { role: oswee.core.vagrant, vagrant_version: '2.2.19' }

## License

MIT

## Author Information

Dzintars Klavins

## TODO

- Make 2 setups available: legacy and upstream.
