# Neovim Nightly

This role is meant to build Neovim from source files.

## Requirements

To use this role, you should first install this collection.
Please visit [Ansible Documentation](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html#installing-a-collection-from-a-git-repository)
to see how to install collection directly from GitHub. I have no plans to use Ansible Galaxy for collection/role publishing.

## Role Variables

## Dependencies

This role depends on:

- `oswee.core.yarn` (it will install `oswee.core.nodejs` as well)

For a up-to-date list of dependencies visit `meta/main.yaml` file.

## Example Playbook

    - hosts: workstation
      roles:
         - { role: oswee.core.nvim }

## License

MIT

## Author Information

Dzintars Klavins

## Credits
