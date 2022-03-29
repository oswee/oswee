# Ansible Hashicorp Vault role

[![Release][image-release]][link-release]

This role installs and configures Vault server

## Requirements

- As it is now, this role requires existing TLS Certificates.
- Firewalld running

## Role Variables

## Dependencies

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Author Information

This role was created in 2020 by [Dzintars Klavins](https://dzintars.github.io)

[image-release]: https://img.shields.io/github/tag/dzintars/ansible-role-vault.svg
[link-release]: https://github.com/dzintars/ansible-role-vault/releases
