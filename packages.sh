#!/bin/bash

if ! sudo -n true 2>/dev/null; then
    echo "Please enter your password:"
    sudo -v
fi

sudo bash -c '
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    dnf update

    dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

    dnf install phonon-qt5-backend-gstreamer \
        libavcodec-freeworld \
        x265 \
        x265-libs \
        intel-media-driver \
        ffmpeg-free
    
    dnf install lm_sensors

    dnf install easyeffects \
        git

    dnf install tlp \
        tlp-rdw

    dnf install --nogpgcheck --repofrompath terra,https://repos.fyralabs.com/terra$releasever terra-release
    dnf install ghostty

    dnf install spectacle

    dnf install google-chrome-stable

    git clone https://github.com/JackHack96/EasyEffects-Presets
    ./EasyEffects-Presets/install.sh
    rm -rf EasyEffects-Presets
'

flatpak install flathub io.github.kolunmi.Bazaar

cp -r ./intel-tdp-man ~/
cp -r ./resolve-shortcut ~/
cp -r ./nvidia-driver-installation ~/