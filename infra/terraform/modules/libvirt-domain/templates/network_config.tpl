version: 2
ethernets:
  ${interface_name}:
    %{ if dhcp == "true" }
    dhcp4: true
    mac: ${mac}
    %{ else }
    addresses: ${addresses}
    gateway4: ${gateway}
    nameservers:
      addresses: ${nameservers}
    %{ endif }
