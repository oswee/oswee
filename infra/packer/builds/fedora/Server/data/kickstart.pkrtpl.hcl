url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch"
repo --name="fedora" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-$releasever&arch=$basearch
repo --name="updates" --mirrorlist=https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f$releasever&arch=$basearch

text
skipx
reboot --eject

keyboard ${vm_guest_os_keyboard}
lang ${vm_guest_os_language}
timezone ${vm_guest_os_timezone} --utc
timesource --ntp-server lv.pool.ntp.org

network --onboot yes --noipv6 --activate
network --hostname fedora37

# users
group --name=admin
group --name=wheel
rootpw --lock
user --name=${build_username} --iscrypted --password=${build_password_encrypted} --shell=/bin/bash --groups=admin,wheel
sshkey --username ${build_username} "${build_ssh_key}"

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

%packages --inst-langs=en
@core
aide
audit
audit-libs
bzip2
chrony
curl
firewalld
libselinux
net-tools
nftables
opensc
openssl-pkcs11
policycoreutils-python-utils
rsyslog
rsyslog-gnutls
sudo
tar
unzip
-kernel-modules-extra
-tigervnc-server*
-gdm
-httpd
-nginx
-tuned
-iprutils
-sssd*
-gtk3
-libreswan
-setroubleshoot
-mcstrans
-prelink
-xorg-x11-server-common
-avahi-daemon
-avahi
-net-snmp
-cups
-dhcp
-dhcp-server
-openldap-clients
-bind
-dnsmasq
-ftp
-vsftpd
-dovecot
-cyrus-imapd
-samba
-squid
-telnet*
-autofs
-wpa_supplicant
-b43-openfwwf
-iwl*
-tcpdump
-wireshark*
-nmap*
-iscsi-initiator-utils*
-fxload
-lsscsi
-ivtv*
-kernel-headers
-rsync
-nfs-utils
-rpcbind
%end

services --enabled=sshd
services --disabled=libvrtd,docker,docker-engine
firewall --enabled --service=sshd
selinux --enforcing
%addon com_redhat_kdump --disable --reserve-mb='auto'
%end


#%post
# Remove root password
#passwd -d root > /dev/null

# Remove random-seed
#rm /var/lib/systemd/random-seed
#%end
