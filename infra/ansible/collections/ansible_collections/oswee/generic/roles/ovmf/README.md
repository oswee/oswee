# oswee.generic.ovmf


## Requirements

Make sure you have at least 10G storage. It fails to build with 5G storage VM.

It is not strictly required to build this from scratch.

You can use `edk2-ovmf` and `edk2.git-ovmf-x64` packages from Fedora.

[Fetching OVMF UEFI from the correct source](https://developer.fedoraproject.org/tools/virtualization/fetching-ovmf-uefi-from-the-correct-source.html)

## Role Variables

## Dependencies

## Example Playbook)

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: oswee.generic.ovmf, x: 42 }

## License

MIT

## Author Information

Dzintars Klavins @dzintars