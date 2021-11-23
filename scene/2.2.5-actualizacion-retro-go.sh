#!/bin/bash
#By julenvitoria

usuario="kde"

clear
if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
else
    echo "El directorio del repo no se ha detectado, no se puede proseguir."
fi
cd -