#!/bin/bash
 
# Run this script in display 0 - the monitor
export DISPLAY=:0
 
# Run x11vnc
/usr/bin/x11vnc  -create -xkb -noxrecord -noxfixes -noxdamage -display :0 -auth /var/run/lightdm/root/:0 -rfbauth /home/kiosk/.x11vnc.pass -forever -rfbport 5905 &

# Run OpenKiosk
/usr/bin/OpenKiosk https://my-web.com &