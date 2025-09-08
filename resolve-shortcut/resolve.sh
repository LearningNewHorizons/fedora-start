#!/bin/bash

# Disable Application menus daemon while starting
dbus-send --session --type=method_call --dest=org.kde.kded6 /kded org.kde.kded6.unloadModule string:"appmenu"

# Start Resolve with only Nvidia drivers and reenable Application menus daemon after 1 minute
__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia /opt/resolve/bin/resolve & \
    sleep 30s && \
    dbus-send --session --type=method_call --dest=org.kde.kded6 /kded org.kde.kded6.loadModule string:"appmenu" && \
    exit