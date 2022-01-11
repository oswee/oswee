# Golang Role

```sh
#export PATH=$PATH:/usr/local/go/bin
#export GOPATH=$HOME/go
```

## Requirements

Any pre-requisites that may not be covered by Ansible itself or the role should be mentioned here. For instance, if the role uses the EC2 module, it may be a good idea to mention in this section that the boto package is required.

## Role Variables

A description of the settable variables for this role should go here, including any variables that are in defaults/main.yml, vars/main.yml, and any variables that can/should be set via parameters to the role. Any variables that are read from other roles and/or the global scope (ie. hostvars, group vars, etc.) should be mentioned here as well.

## Dependencies

A list of other roles hosted on Galaxy should go here, plus any details in regards to parameters that may need to be set for other roles, or variables that are used from other roles.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

## License

BSD

## Author Information

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

Some places to look fot env variables:

System wide

`/etc/environment`: specifically meant for environment variables
`/etc/env.d/*`: environment variables, split in multiple files
`/etc/profile`: all types of initialization scripts
`/etc/profile.d/*`: initialization scripts
`/etc/bashrc`, `/etc/bash.bashrc`: meant for functions and aliases
User specific

`~/.bash_profile`: initialization for login (bash-)shells
`~/.bashrc`: initialization for all interactive (bash-)shells
`~/.profile`: used for all shells
`~/.cshrc`, `~/.zshrc`, `~/.tcshrc`: similar for non-bash shells

## ENV variables

Tim Heckman 21:49
@Dzintars tbh, I'd recommend that being at the front and not the end.
21:50
PATH=/usr/loca/go/bin:$PATH

Dzintars Klavins 21:51
hmm... i need to look into that to learn why is that. Currently i don't see any issue. It works as expected. Thank You. (edited)

Tim Heckman 21:52
@Dzintars to avoid system packages, or other things, installing something that overrides the Go you want to use.
21:53
@Dzintars best practice is to have your non-system / local paths before the system ones, so that your PATH lookups more-generally get the binaries you want / are local to you.
21:54
@Dzintars you see things like /usr/local/bin coming before /bin, for example. This is no different. (edited)

Dzintars Klavins 21:55
Understood. Will try this now. Thank you again. :slightly_smiling_face:
