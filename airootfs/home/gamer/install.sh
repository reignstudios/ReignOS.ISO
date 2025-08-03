#!/bin/bash

# args
USE_WESTON=false
USE_CAGE=false
USE_LABWC=false
USE_X11=false
for arg in "$@"; do
 if [ "$arg" = "-weston" ]; then
  USE_WESTON=true
 fi

 if [ "$arg" = "-cage" ]; then
  USE_CAGE=true
 fi

 if [ "$arg" = "-labwc" ]; then
  USE_LABWC=true
 fi

 if [ "$arg" = "-x11" ]; then
  USE_X11=true
 fi
done

# config installer
echo "Starting ReignOS.Installer..."
cd /home/gamer/ReignOS/Installer/ReignOS.Installer/bin/Release/net8.0/linux-x64/publish/
chmod +x ./ReignOS.Installer

if [ "$USE_WESTON" = "true" ]; then
 weston --shell=kiosk-shell.so --xwayland -- ./ReignOS.Installer -weston
fi

if [ "$USE_CAGE" = "true" ]; then
 cage -d -s -- ./ReignOS.Installer -cage
fi

if [ "$USE_LABWC" = "true" ]; then
 labwc --startup "./ReignOS.Installer -labwc"
fi

if [ "$USE_X11" = "true" ]; then
 startx
fi

# relaunch
echo "Hit Ctrl+C if you don't want to relaunch installer..."
sleep 3
/home/gamer/install.sh $@
