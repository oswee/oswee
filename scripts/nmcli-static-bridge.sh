#!/bin/sh

# Author: Dzintars Klavins
# This script will setup new bridge connection
# Make sure this file is executable

NETWORK_ETHERNET_DEVICE="eno1"
NETWORK_ETHERNET_CONNECTION="eno1"
NETWORK_BRIDGE_DEVICE="virbr0"
NETWORK_BRIDGE_CONNECTION="virbr0"
NETWORK_GW_ADDRESS="192.168.254.254"
NETWORK_IP_ADDRESS="192.168.100.1"
NETWORK_DNS_ADDRESES="1.1.1.1,8.8.8.8"

# ========================
# Network cleanup
# ========================

# All credits to: https://www.rene-pickhardt.de/index.html%3Fp=1955.html

read -p "Do you really want to delete current network connections and devices? (y/n)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # Delete all existing connections
  for i in `nmcli c | \
    grep -o -- "[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}"` ; \
    do nmcli connection delete uuid $i ; \
  done
  echo "All network connections deleted!"

  # Delete all existing devices
  for i in `nmcli d | \
    grep -o -- "[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}"` ; \
    do nmcli device delete uuid $i ; \
  done
  echo "All network devices deleted!"
fi

# ========================
# Bridge network setup
# ========================

# Create new bridge connection
nmcli connection add ifname ${NETWORK_BRIDGE_DEVICE} type bridge autoconnect yes con-name ${NETWORK_BRIDGE_CONNECTION}

# Modify bridge connection properties
nmcli connection modify ${NETWORK_BRIDGE_CONNECTION} ipv4.address ${NETWORK_IP_ADDRESS}/16
nmcli connection modify ${NETWORK_BRIDGE_CONNECTION} ipv4.method manual
nmcli connection modify ${NETWORK_BRIDGE_CONNECTION} ipv4.gateway ${NETWORK_GW_ADDRESS}
nmcli connection modify ${NETWORK_BRIDGE_CONNECTION} ipv4.dns ${NETWORK_DNS_ADDRESES}

# Bring bridged connection up
nmcli connection up ${NETWORK_BRIDGE_CONNECTION}

# Add slave for bridged connection
nmcli connection add type bridge-slave autoconnect yes con-name ${NETWORK_ETHERNET_CONNECTION} ifname ${NETWORK_ETHERNET_DEVICE} master ${NETWORK_BRIDGE_CONNECTION}
nmcli connection reload

# Bring up slave connection
nmcli connection down ${NETWORK_ETHERNET_CONNECTION} && nmcli connection up ${NETWORK_ETHERNET_CONNECTION}

# View bridge details
echo "`nmcli connection show ${NETWORK_BRIDGE_CONNECTION}`"

# ========================
# Network validation
# ========================

# ping google.com
# Ping will not work immediately! Takes about 5s.
