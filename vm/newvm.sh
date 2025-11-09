#!/usr/bin/env bash

name=$1
image=$2
size=$3

if [[ $# -lt 3 ]]; then
  echo "Usage: \"newvm.sh name image size\""
  echo "Where:"
  echo "The image is the installer image to boot from"
  echo "The name is the name you want to give to the virtual machine"
  echo "The size is how much permanent memory you want to give the virtual machine"
  echo ""
  echo "note: the first boot after the install will use 4G of ram by default"
  exit 0
fi

qemu-img create -f qcow2 "$name".qcow2 "$size"

printf "This will open a kvm window where you will have to enter the installer. Continue? [y/n]: "
read -a x
if [[ $x == "n" ]]; then
  echo "Cancelling script actions..."
  rm "$name".qcow2 && echo "Removed hard disk image"
  exit 0
fi


qemu-system-x86_64 -cdrom images/"$image" -m 4G -hda "$name".qcow2

echo
echo "--------------------------------------------------------------------"

printf "Reboot newly created disk image? [y/n]: "
read -a x
if [[ $x == "n" ]]; then
  echo "Virtual machine created" 
  printf "Delete the original boot image? [y/n]: "
  read -a y
  if [[ $y == "n" ]]; then
    echo "Enter the following command to boot the created disk image:"
    echo "qemu-system-x86_64 -m 4G -hda $name.qcow2"
    echo "Script ended"
    exit 0
  fi
  echo "Deleting boot image..."
  rm images/"$image" && echo "Script ended"
  exit 0
fi

echo "Virtual machine created" 
printf "Delete the original boot image? [y/n]: "
read -a y
if [[ $y == "y" ]]; then
  echo "Deleting boot image..."
  rm images/"$image" && echo "Script ended"
fi

qemu-system-x86_64 -m 4G -hda "$name".qcow2 \ 
-netdev user,id=net0,hostfwd=tcp::2222-:22 \
-device virtio-net-pci,netdev=net0 &disown
echo "Script ended"
