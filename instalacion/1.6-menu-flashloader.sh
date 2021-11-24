#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W - Utilidades de flasheo" \
--title "G&W menu flashloader" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Nueva instalacion del flashloader" \
   2 "Actualizacion del directorio del repo" \
   3 "Reset del directorio del repo y descarga desde 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-flashloader
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-flashloader.git
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-flashloader
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "El directorio del repo no se ha detectado, no se puede proseguir."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-flashloader
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    fi
    clear;;
esac
clear

