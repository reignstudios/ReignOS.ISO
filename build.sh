#!/bin/bash

echo "Delete ReignOS repo"
rm -rf ~/ReignOS/airootfs/home/gamer/ReignOS

echo "Clone ReignOS repo"
cd ~/ReignOS/airootfs/home/gamer
git clone https://github.com/reignstudios/ReignOS.git

echo "Build repo"
cd ~/ReignOS/airootfs/home/gamer/ReignOS
git checkout dev
cd ~/ReignOS/airootfs/home/gamer/ReignOS/Installer
dotnet clean
dotnet publish -r linux-x64 -c Release

echo "Cleaning build cache"
cd ~/ReignOS
rm -rf work/ out/

echo "Build ISO"
mkarchiso -v . configs/reignos

#chmod +x ./mkarchiso_ReignOS
#./mkarchiso_ReignOS -v .

echo "Mount share drive"
#mount -t vboxsf share /mnt/share

echo "Ready to copy ISO"
