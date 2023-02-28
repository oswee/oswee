# Server

`sudo lvcreate -n lvregistry -L 20G vgdata`

`sudo mkfs -t ext4 /dev/vgdata/lvregistry`

`sudo mount /dev/vgdata/lvregistry /media/registry`

`sudo mkdir -p /media/registry/{qemu/{artifacts,upstream},iso,vagrant}`

`sudo chown -R dzintars:dzintars /media/registry`