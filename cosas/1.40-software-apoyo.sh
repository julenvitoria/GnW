#!/bin/bash

usuario="kde"

#instalacion de retro-go y programas de apoyo
clear
cd /home/$usuario/gameandwatch
if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
    sudo rm -R /home/$usuario/gameandwatch/game-and-watch-backup
fi
if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
    sudo rm -R /home/$usuario/gameandwatch/game-and-watch-flashloader
fi
if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
    sudo rm -R /home/$usuario/gameandwatch/game-and-watch-retro-go
fi
if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
    sudo rm -R /home/$usuario/gameandwatch/game-and-watch-patch
fi
if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
    sudo rm -R /home/$usuario/gameandwatch/LCD-Game-Shrinker
fi
git clone https://github.com/ghidraninja/game-and-watch-backup.git
git clone https://github.com/ghidraninja/game-and-watch-flashloader.git
git clone --recurse-submodules https://github.com/kbeckmann/game-and-watch-retro-go
git clone https://github.com/BrianPugh/game-and-watch-patch
git clone https://github.com/bzhxx/LCD-Game-Shrinker
cd game-and-watch-retro-go
pip3 install -r requirements.txt
cd ..
cd game-and-watch-patch
pip3 install -r requirements.txt
make download_sdk
