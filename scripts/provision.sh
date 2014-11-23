#!/bin/bash -eux

# Install Puppet client
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install -y puppet
