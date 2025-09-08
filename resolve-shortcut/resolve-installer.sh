#!/bin/bash

DAVINCI_RESOLVE_INSTALLER=$1

if ! sudo -n true 2>/dev/null; then
    echo "Please enter your password:"
    sudo -v
fi

sudo bash -c '
    chmod +x $1
    dnf install libxcrypt-compat libcurl libcurl-devel mesa-libGLU
' -- ${DAVINCI_RESOLVE_INSTALLER}

SKIP_PACKAGE_CHECK=1 ./$1 -i

sudo bash -c '
    mkdir /opt/resolve/libs/oldlibs
    mv /opt/resolve/libs/libglib* /opt/resolve/libs/oldlibs/
    mv /opt/resolve/libs/libgio* /opt/resolve/libs/oldlibs/
    mv /opt/resolve/libs/libgmodule* /opt/resolve/libs/oldlibs/
    mv /opt/resolve/libs/libgobject* /opt/resolve/libs/oldlibs/
'