#!/bin/sh

# Author: Dzintars Klavins
# This script will setup new connection
# Make sure this file is executable

NETWORK_ETHERNET_DEVICE="eno1"
NETWORK_ETHERNET_CONNECTION="eno1"
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

  # Delete all devices (optional/not sure)
  for i in `nmcli d | \
    grep -o -- "[0-9a-fA-F]\{8\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{4\}-[0-9a-fA-F]\{12\}"` ; \
    do nmcli device delete uuid $i ; \
  done
  echo "All network devices deleted!"
fi

# ========================
# Ethernet network setup
# ========================

# Create new ethernet connection
nmcli connection add type ethernet autoconnect yes con-name ${NETWORK_ETHERNET_CONNECTION} ifname ${NETWORK_ETHERNET_DEVICE}

# Modify ethernet connection properties
nmcli connection modify ${NETWORK_ETHERNET_CONNECTION} ipv4.address ${NETWORK_IP_ADDRESS}/16
nmcli connection modify ${NETWORK_ETHERNET_CONNECTION} ipv4.method manual
nmcli connection modify ${NETWORK_ETHERNET_CONNECTION} ipv4.gateway ${NETWORK_GW_ADDRESS}
nmcli connection modify ${NETWORK_ETHERNET_CONNECTION} ipv4.dns ${NETWORK_DNS_ADDRESES}

# Reload the connection
nmcli connection reload

# Bring connection up
nmcli connection up ${NETWORK_ETHERNET_CONNECTION}

# ========================
# Network validation
# ========================

# View bridge details
nmcli connection show ${NETWORK_BRIDGE_CONNECTION}

# ping google.com
# Ping will not work immediately!
