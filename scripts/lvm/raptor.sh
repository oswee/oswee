#!/bin/sh

# This script is used to create storage for Libvirt storage pools as Logical volumes

set -e

# Create mount point directory
mkdir -p /data/raptor

chown -R dzintars. /data/raptor

virsh pool-define ./scripts/lvm/libvirt-pool.xml

virsh pool-autostart raptor

virsh pool-start raptor
