url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name="fedora" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name="updates" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

### Performs the kickstart installation in text mode.
### By default, kickstart installations are performed in graphical mode.
text

# Do not configure the X Window System
skipx

### Sets the language to use during installation and the default language to use on the installed system.
lang ${vm_guest_os_language}

### Sets the default keyboard type for the system.
keyboard ${vm_guest_os_keyboard}

network --onboot yes --hostname workstation.oswee.local

### Lock the root account.
# rootpw --lock

### The selected profile will restrict root login.
### Add a user that can login and escalate privileges.
user --name=${build_username} --iscrypted --password=${build_password_encrypted} --groups=wheel
sshkey --username vagrant "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGwrvCrJyfP38lM6YpF49d95ReVT5MYhG9CjkxPidKgpYUI/Lmr8kZ132aEGuugnFOzzol/aPmAIjuXtmzsg8zrSAFuTM3rZY88ZebiNeg+Ywwwsz4/BP8aYXRtiZ/FGcjpVsp+cihiX7rVx5PNFxHcrPdI+aqfcPS5MYxm7ZrRzyaT6w== dzintars@workstation"

#firewall --enabled --service=sshd
#services --enabled=sshd --disabled=libvrtd,docker,docker-engine
#selinux --enforcing

timezone ${vm_guest_os_timezone}

### https://github.com/sej7278/virt-installs/blob/master/rhel9_cis.cfg#L50
### https://github.com/claudiusask/foreman-katello/blob/edef3fc1f9ce083e67d521a90be6180883ff987f/Packer/scripts/kickstart.cfg
zerombr
bootloader --location=mbr --append="audit=1 selinux=1 enforcing=1 page_poison=1 vsyscall=none slub_debug=P pti=on"
clearpart --all --initlabel

part /boot      --fstype xfs  --size=1024  --fsoptions="nodev,nosuid,noexec"
part /boot/efi  --fstype efi  --size=600   --fsoptions="umask=0077,shortname=fedora"

part pv.0 --size=1 --grow --asprimary

volgroup vgroot pv.0

logvol swap            --fstype swap  --vgname=vgroot  --name=swap    --size=1024
logvol /               --fstype xfs   --vgname=vgroot  --name=root    --size=4192
logvol /var            --fstype xfs   --vgname=vgroot  --name=var     --size=2048  --fsoptions="nodev,nosuid,noexec"
logvol /var/tmp        --fstype xfs   --vgname=vgroot  --name=vartmp  --size=1024  --fsoptions="nodev,nosuid,noexec"
logvol /var/log        --fstype xfs   --vgname=vgroot  --name=log     --size=1024  --fsoptions="nodev,nosuid,noexec"
logvol /var/log/audit  --fstype xfs   --vgname=vgroot  --name=audit   --size=1024  --fsoptions="nodev,nosuid,noexec"
logvol /home           --fstype xfs   --vgname=vgroot  --name=home    --size=1024  --fsoptions="quota,usrquota,grpquota,nodev,nosuid,noexec"

#%post
# Remove root password
#passwd -d root > /dev/null

# Remove random-seed
#rm /var/lib/systemd/random-seed
#%end

### Packages selection.
%packages --inst-langs=en
#@^cloud-server-environment
dnf-yum
#fuse-sshfs
kernel-core
#rsync
-kernel
-zram-generator-defaults
#-plymouth
#-dracut-config-rescue
#-firewalld
#-geolite2-city
#-geolite2-country
%end

### Reboot after the installation is complete.
### --eject attempt to eject the media before rebooting.
reboot --eject
