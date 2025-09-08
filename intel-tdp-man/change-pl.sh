#!/bin/bash

pl1=$(($1*1000000))
pl2=$(($2*1000000))

echo "$pl1"
echo "$pl2"

if [ $1 -lt 46 ] && [ $2 -lt 116 ] && [ $1 -gt 7 ] && [ $2 -gt $1 ]; then
    if ! sudo -n true 2>/dev/null; then
        echo "Please enter your password:"
        sudo -v
    fi
    sudo bash -c '
        echo "$1" > /sys/class/powercap/intel-rapl/intel-rapl:0/constraint_0_power_limit_uw
        echo "$2" > /sys/class/powercap/intel-rapl/intel-rapl:0/constraint_1_power_limit_uw
    ' -- "$pl1" "$pl2"
fi

if [ $3 -eq 1 ]; then
    kscreen-doctor output.1.mode.1
fi

if [ $3 -eq 2 ]; then
    kscreen-doctor output.1.mode.2
fi
