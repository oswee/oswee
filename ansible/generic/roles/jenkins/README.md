# Ansible Jenkins role

[![Release][image-release]][link-release]

A brief description of the role goes here.

## Requirements

This role requires running Vault server for the SSH User Certificate rotation.
If the Vault server is not accessible User Certificates will not be rotated and
will Jenkins will not be able to connec to the hosts.

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

[image-release]: https://img.shields.io/github/tag/dzintars/ansible-role-jenkins.svg
[link-release]: https://github.com/dzintars/ansible-role-jenkins/releases
