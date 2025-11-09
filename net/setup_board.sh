#!/usr/bin/env bash

# run with sudo -E


function procedure() {
  
# Install the required dependency (Fedora-specific)
  dnf install dhcp-server
  dnf install iptables-services

  routerIP=$1
  externalNet=$2
  internalNet=$3

  # Allow ipv4 forwarding
  echo "net.ipv4.ip_forward = 1" > /etc/sysctl.conf

  # Reload the config to apply changes
  sysctl -p

  # Add a static ip to the device on the interface
  # that will be the gateway of the internal network
nmcli connection add save yes connection.type "802-3-ethernet" connection.id "Board eth" connection.interface-name "$internalNet" ipv4.addresses "$routerIP"
nmcli connection modify "Board eth" ipv4.method shared ipv4.addresses 198.168.10.1/24
nmcli connection up "Board eth"

nmcli connection modify "NUMERICABLE-92B4" ipv4.dns "198.168.10.173"
nmcli connection modify "NUMERICABLE-92B4" ipv4.ignore-auto-dns yes
nmcli connection down "NUMERICABLE-92B4"
nmcli connection up "NUMERICABLE-92B4"

  systemctl enable iptables
  # We append a rule to the nat table that handles
  # outgoing packets, by masquerading the src address
  # of the packet as the device's address on the external network
  iptables -t nat -A POSTROUTING -o "$externalNet" -j MASQUERADE

  # We append to the filter table (default table) that handles
  # packets being routed, on the condition that the packet
  # is associated with a connection which has seen packets in 
  # both directions or that it is starting a new connection 
  # associated with an existing one
  iptables -A FORWARD -i "$externalNet" -o "$internalNet" -m state --state RELATED,ESTABLISHED -j ACCEPT
  
  # Same thing but without a condition
  iptables -A FORWARD -i "$internalNet" -o "$externalNet" -j ACCEPT

  iptables-save
  # Configures dhcp server
  rm /etc/dhcpd.conf
  cp ./dhcpd.conf /etc/dhcp/dhcpd.conf
  systemctl enable dhcpd
  systemctl start dhcpd

  rm /etc/resolv.conf
  echo "nameserver 198.168.10.173" > /etc/resolv.conf

}



# Should be run with sudo

# Hard-coded because it is way too dependent
# on what the user wants and his device/distribution
internalNet="enp46s0"
externalNet="wlp45s0"
routerIP="198.168.10.1/24"

procedure $routerIP $externalNet $internalNet
