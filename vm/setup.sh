#!/usr/bin/env bash

# Install all the virtualization packages
dnf group install --with-optional virtualization
# Enable the libvirtd service
systemctl start libvirtd
systemctl enable libvirtd
# Enabling the user to run virt-manager without sudo privileges
# Wont't work if run from inside the script so copy and paste it in your terminal manually
# usermod -a -G libvirt $(whoami)
