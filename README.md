# Packer-CentOS-6

This [Packer](https://packer.io/) template will produce a minimal CentOS 6.6 Vagrant box with VirtualBox Guest Additions and Puppet client installed.

Attempts have been made to reduce the size of the output image. After building the VirtualBox Guest Additions, almost all build tools are removed. All free disk space will then be zeroed out so that the image can be compressed more effectively. The resulting image should be around 520MB in size.

## Requirements

  - [Packer](https://www.packer.io/)
  - [VirtualBox](https://www.virtualbox.org/)
  - [Vagrant](https://vagrantup.com/)
  - About 3GB of free space while building the image

## Usage

Run the following command:

`packer build centos6.json`

After a few minutes, a Vagrant box file can be found in the `builds/` directory. 

## Settings

The installation ISO is retrieved from servers in The Netherlands and the machine's timezone will be set to Europe/Amsterdam. You can change those settings in `centos6.json` and `http/ks.cfg`.

The Packer template in `centos6.json` can also be modified to produce other things than a Vagrant box. Refer to Packer's documentation to read how.
