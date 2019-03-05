#!/usr/bin/env bash
# Adjust this as needed
DRIVER="/home/pi/Downloads/HuionKamvasGT191LinuxDriver/kamvas.py"

T="256c:006e"
BUS=$(lsusb | grep "$T" | sed -e 's|Bus \([0-9]*\) Device \([0-9]*\):.*$|\1|g')
DEV=$(lsusb | grep "$T" | sed -e 's|Bus \([0-9]*\) Device \([0-9]*\):.*$|\2|g')

sudo rmmod hid_uclogic
sudo modprobe uinput
sudo udevadm control --reload
sudo udevadm trigger
sudo /usr/bin/uclogic-probe $BUS $DEV | /usr/bin/uclogic-decode
sudo python3 $DRIVER
