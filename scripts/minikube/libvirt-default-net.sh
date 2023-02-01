#!/bin/sh

# Author: Dzintars Klavins
# This script will create Libvirt default network
# Make sure this file is executable
# User should be part of Libvirt group Qemu should have access to user directories
# See oswee.generic.libvirt Ansible role

# ========================
# Network setup
# ========================

# Stop default network
virsh net-destroy default
# Delete default network
virsh net-undefine default

# virsh net-define /usr/share/libvirt/networks/default.xml
virsh net-define ./scripts/minikube/libvirt-default-net.xml

virsh net-autostart default

virsh net-start default

# virsh net-list --all
