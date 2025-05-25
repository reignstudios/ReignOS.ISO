#!/bin/bash

useradd -m -G wheel -s /bin/bash gamer
passwd -d gamer
usermod -aG wheel gamer
