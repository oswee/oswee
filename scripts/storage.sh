#!/bin/sh

# This script is used to prepare spare hard drive to use as "local volume" in Kubernetes (Minikube) cluster.

# Format the Raptor drive
# TODO: Can i use drive ID for dd and how to obtain it? `blkid /dev/sda`
sudo dd if=/dev/zero of=/dev/sda bs=1M status=progress
# Create physical volume from entire disk
sudo pvcreate /dev/sda
# Create volume group and attach raptor disk to it
sudo vgcreate vgdata /dev/sda
# Create volume group
sudo lvcreate -n lvminio -L 100G vgdata
# Create file system
mkfs -t ext4 /dev/vgdata/lvminio
# Create mount point directory
mkdir -p /data/minio
# Create SystemD Mount unit
cat <<EOT >> /etc/systemd/system/data-minio.mount
[Unit]
Description=MinIO Share
Before=local-fs.target

[Mount]
What=/dev/vgdata/lvminio
Where=/data/minio
Type=ext4

[Install]
WantedBy=local-fs.target
EOT
# Enable SystemD mount unit
systemctl enable data-minio.mount
# Start SystemD mount unit
systemctl start data-minio.mount
