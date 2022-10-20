#!/bin/sh

# This script is used to create temporary storage for Terraform state files while bootstrapping the whole system.
# At the end of bootstrap process these state files should be imported into permanent Terraform state.

set -e

# Create volume group
sudo lvcreate -n lvterraform -L 5G vgdata

# Create file system
# DANGER: This potentially can destroy your data if it is already located in this volume!
# Be careful making modifications in this command.
sudo mkfs -t ext4 /dev/vgdata/lvterraform

# Create mount point directory
sudo mkdir -p /data/tf

sudo chown -R dzintars. /data/tf

# Create SystemD Mount unit
sudo cat <<EOT >> /etc/systemd/system/data-tf.mount
[Unit]
Description=Terraform bootstrap state
Before=local-fs.target

[Mount]
What=/dev/vgdata/lvterraform
Where=/data/tf
Type=ext4

[Install]
WantedBy=local-fs.target
EOT

# Restart the SystemD daemon
sudo systemctl daemon-reexec

# Enable SystemD mount unit
sudo systemctl enable data-tf.mount

# Start SystemD mount unit
sudo systemctl start data-tf.mount
