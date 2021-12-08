#!/bin/bash
#By julenvitoria

usuario="kde"

clear
if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
    cd /home/$usuario/gameandwatch/game-and-watch-patch
    git pull --recurse-submodules
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
else
    echo "El directorio del repo no se ha detectado, no se puede proseguir."
fi
