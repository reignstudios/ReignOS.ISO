#!/bin/bash

exec openbox-session &
cd /home/gamer/ReignOS/Installer/ReignOS.Installer/bin/Release/net8.0/linux-x64/publish/
chmod +x ./ReignOS.Installer
./ReignOS.Installer -x11
