#!/bin/bash

if ! sudo -n true 2>/dev/null; then
    echo "Please enter your password:"
    sudo -v
fi

sudo bash -c '
    dnf remove nvidia* --noautoremove
    dnf remove xorg-x11-drv-nouveau

    dnf install akmod-nvidia \
        xorg-x11-drv-nvidia-cuda
    akmods --force
    reboot
'