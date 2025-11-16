#!/usr/bin/env bash
name=$1
qemu-system-x86_64 -m 4G -hda "$name" \
-netdev user,id=net0,hostfwd=tcp::2222-:22 \
-device virtio-net-pci,netdev=net0 -usb -device usb-tablet &disown
