# Molecule

## Config

Molecule supports base config to include in scenarios.
Because most scenarios will be similarly configured you can extract the common configuration into
`~/.config/molecule/config.yml` file. This file is sourced automatically by Molecule if exists.

But in case of working with multiple projects, this could not suit the needs as each pojectt could be
differently configured.
So you could place the common config in `git-repo/ansible/collection-a/.config/molecule/config.yml`
Molecule documentation lacks the explanation, but this config will not be sourced automatically.
On top of that, there is no ENV variable to specify base config file.
The only option ATM is to use `molecule --base-config .config/molecule/config.yml create -s dev`.
