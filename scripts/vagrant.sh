#!/bin/sh

# Author: Dzintars Klavins
# This script will fix the `undefined symbol: EVP_KDF_ctrl` issue for vagrant-libvirt plugin.
# Checked only on Fedora 35 distribution.
# This script must be executed after oswee.generic.vagrant Ansible role.

set -e

mkdir /tmp/vagrant

pushd /tmb/vagrant

# Override Vagrants embedded Libssh library
dnf download --source libssh
rpm2cpio libssh-0.9.6-1.fc35.src.rpm | cpio -imdV
tar xf libssh-0.9.6.tar.xz
mkdir build && cd build
cmake ../libssh-0.9.6 -DOPENSSL_ROOT_DIR=/opt/vagrant/embedded/ && make
sudo cp lib/libssh* /opt/vagrant/embedded/lib64

# Override Vagrants embedded Krb5 library
dnf download --source krb5-libs
rpm2cpio krb5-1.19.2-8.fc35.src.rpm | cpio -imdV
tar xf krb5-1.19.2.tar.gz
cd krb5-1.19.2/src
./configure && make
sudo cp -a lib/crypto/libk5crypto.* /opt/vagrant/embedded/lib64/

# Cleanup
rm -rf /tmp/vagrant

popd
