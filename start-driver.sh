#!/usr/bin/env bash
# Adjust this as needed
DRIVER="./kamvas.py"

T="256c:006e"
BUS=$(lsusb | grep "$T" | sed -e 's|Bus \([0-9]*\) Device \([0-9]*\):.*$|\1|g')
DEV=$(lsusb | grep "$T" | sed -e 's|Bus \([0-9]*\) Device \([0-9]*\):.*$|\2|g')

sudo rmmod hid_uclogic
sudo modprobe uinput
sudo udevadm control --reload
sudo udevadm trigger
sudo uclogic-probe $BUS $DEV | uclogic-decode
sudo python3 $DRIVER
