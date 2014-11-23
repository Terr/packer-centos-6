#!/bin/bash -eux

# Remove packages that were needed to install VirtualBox guest additions
yum erase -y kernel-devel
yum erase -y kernel-firmware
yum erase -y kernel-headers
yum erase -y perl
yum erase -y gcc
#yum erase -y make  # Can't remove this package as it affects yum, apparently

yum -y clean all

# Clean network configuration
sed -i '/HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i "/^UUID/d" /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i "/^UUID/d" /etc/sysconfig/network-scripts/ifcfg-eth0
rm -f /etc/ssh/ssh_host_*
rm -f /etc/udev/rules.d/70-persistent-net.rules
rm -f /var/lib/dhclient/dhclient-eth0.leases

rm -rf /tmp/*

# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Ensure SELinux is disabled
sed -i "s/^\(SELINUX=\).*/\1disabled/g" /etc/sysconfig/selinux

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
