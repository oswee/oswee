url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name="fedora" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name="updates" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

### Performs the kickstart installation in text mode.
### By default, kickstart installations are performed in graphical mode.
text

### Sets the language to use during installation and the default language to use on the installed system.
lang ${vm_guest_os_language}

### Sets the default keyboard type for the system.
keyboard ${vm_guest_os_keyboard}

### Lock the root account.
rootpw --lock

### The selected profile will restrict root login.
### Add a user that can login and escalate privileges.
user --name=${build_username} --iscrypted --password=${build_password_encrypted} --groups=wheel

# Firewall configuration
firewall --disabled

### Sets up the authentication options for the system.
### The SSDD profile sets sha512 to hash passwords. Passwords are shadowed by default
### See the manual page for authselect-profile for a complete list of possible options.
authselect select sssd

### Sets the state of SELinux on the installed system.
### Defaults to enforcing.
selinux --disabled

timezone ${vm_guest_os_timezone}

### Sets how the boot loader should be installed.
bootloader --append="no_timer_check console=tty1 console=ttyS0,115200n8 net.ifnames=0 biosdevname=0" --location=mbr --timeout=1

### Initialize any invalid partition tables found on disks.
zerombr

### Create primary system partitions.
autopart --type=plain --nohome --noboot --noswap

### System services
services --disabled="cloud-init,cloud-init-local,cloud-config,cloud-final" --enabled="sshd,cloud-init,cloud-init-local,cloud-config,cloud-final"

### Packages selection.
%packages --inst-langs=en
@^cloud-server-environment
dnf-yum
fuse-sshfs
kernel-core
rsync
-dracut-config-rescue
-firewalld
-geolite2-city
-geolite2-country
-kernel
-plymouth
-zram-generator-defaults
%end

### Reboot after the installation is complete.
### --eject attempt to eject the media before rebooting.
reboot --eject
