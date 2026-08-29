#!/bin/bash

echo "Giving mesa a few seconds..."
sleep 5

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

# default arg if none set
if [ "$USE_WESTON" != "true" ] && [ "$USE_CAGE" != "true" ] && [ "$USE_LABWC" != "true" ] && [ "$USE_X11" != "true" ]; then
 USE_WESTON=true
fi

# config installer
echo "Starting ReignOS.Installer..."
cd /home/gamer/ReignOS/Installer/ReignOS.Installer/bin/Release/net10.0/linux-x64/publish/
chmod +x ./ReignOS.Installer

if [ "$USE_WESTON" = "true" ]; then
 weston --shell=kiosk-shell.so --xwayland -- ./ReignOS.Installer -weston

 # relaunch
 echo "Hit Ctrl+C if you don't want to relaunch installer..."
 sleep 5
 /home/gamer/install.sh -cage
fi

if [ "$USE_CAGE" = "true" ]; then
 cage -d -s -- ./ReignOS.Installer -cage

 # relaunch
 echo "Hit Ctrl+C if you don't want to relaunch installer..."
 sleep 5
 /home/gamer/install.sh -labwc
fi

if [ "$USE_LABWC" = "true" ]; then
 labwc --startup "./ReignOS.Installer -labwc"

  # relaunch
 echo "Hit Ctrl+C if you don't want to relaunch installer..."
 sleep 5
 /home/gamer/install.sh -x11
fi

if [ "$USE_X11" = "true" ]; then
 startx
fi
