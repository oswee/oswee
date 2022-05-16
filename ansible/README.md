# Oswee Ansible Collections

These are NOT PRODUCTION READY collections!

Some of roles are specific to my particular usecases.

Most likely You don't want to use this collection ATM.

## Usage

Include the collection in your project collections.yml file and import it.

```bash
ansible-galaxy collection install -r collections.yml -f
```

`-f` flag will force collection upgrade.

To install all collections from this repository use

```bash
 ansible-galaxy collection install git+https://github.com/oswee/prime.git#/ansible/,master
```

To install only `generic` collection from this repository use

```bash
 ansible-galaxy collection install git+https://github.com/oswee/prime.git#/ansible/generic/,master
```

### Skeleton (Role bootstrapping)

To bootstrap new roles you can use Skeleton.
Use `ansible-galaxy init --role-skeleton=.skeleton namespace/roles/role-name` from the `./ansible/` directory.
`namespace/role/` prefix will be stripped in the output files.
All template files are located in `./.skeleton/*` directory.

### Molecule init

UPDATE: You should not place Molecule inside of individual role. Molecule now is moved to the collection
level.
In general `molecule init` is not used there. You can copy `default` scenario as a base.

### Molecule dependencies

To resolve Molecule dependencies in local development follow this (discussion)[https://github.com/oswee/ansible/discussions/73].

Make sure you have namespace created `mkdir -p ~/.ansible/collections/ansible_collections/oswee/`
Then from each collection create symlink like `ln -s $PWD ~/.ansible/collections/ansible_collections/oswee/`
This will eliminate the need to do `ansible-galaxy collection install git+https://github.com/oswee/prime.git#/ansible/,master -f`
all the time.

### Molecule testing

Use this evironment variable to get the colorfule molecule run output:

```bash
export PY_COLORS=1
```

I'm sure there is something wrong with my TTY color setup, but i'm too lazy to fix it now.

To test the role use:

```bash
cd collection-name
molecule converge -s role-name
```

```bash
molecule --base-config .config/molecule/config.yml converge -s dev -- --limit bastion --tags envoy
```

```bash
molecule --base-config .config/molecule/config.yml converge -s dev -- --limit workstations --tags nvim.modules.lsp
```

Vagrant is the only maintained scenario if at all (too early to spend time on pollishing up the roles).
Later potentially I will introduce Podman scenario as well.
No any plans of supporting Docker.

## Known issues

There could be issues with OPENSSL library mismatch between Vagrant ruby gems and the
system libraries. The solution was to download libssl, build it and to copy libk5crypto files into
`/opt/vagrant/embedded/lib64` directory.
Follow the Fedora instructions listed in [molecule-libvirt](https://github.com/ansible-community/molecule-libvirt) repository readme.
This [issue](https://github.com/hashicorp/vagrant/issues/11020) is the primary source to the solution
UPDATE: https://github.com/hashicorp/vagrant/issues/11020#issuecomment-974222044

If Vagrant is complaining about inability to create `virbr0` network, most likely it is worth to re-run
`oswee.general.libvirt` role.
I had no jet figured out what exactly is broken, but reapplying libvirt role, helps.
