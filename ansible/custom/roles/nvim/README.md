# Neovim Nightly

This role configures Neovim to my personal liking and currently is WIP.
Many things are broken and not configured properly.

## Requirements

To use this role, you should install this collection first.
Please visit [Ansible Documentation](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html#installing-a-collection-from-a-git-repository)
to see how to install collection directly from GitHub. I have no plans to use Ansible Galaxy for collection/role publishing.

## Role Variables

## Dependencies

This role depends on:

- `oswee.generic.nvim` (it will install `oswee.generic.yarn/nodejs` as well)
- `oswee.generic.golang`
- `oswee.generic.github`

For a up-to-date list of dependencies visit `meta/main.yaml` file.

## Example Playbook

    - hosts: workstation
      roles:
         - { role: oswee.custom.nvim }

## License

MIT

## Author Information

Dzintars Klavins

## Credits

I am not a Lua and Neovim expert. That's why I rely on the power of the open-source.
These are some core repositories I took inspiration from:

- [](https://github.com/konapun/dotfiles)
- [](https://github.com/Allaman/nvim)
- [](https://github.com/mnabila/nvimrc)
- [](https://github.com/tjdevries/config_manager)

You should take a look at these repositories first. And do not forget go give some stars to them.
