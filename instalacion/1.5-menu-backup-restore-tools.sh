#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W - Herramientas de backup y restauracion" \
--title "G&W menu herramientas backup y restauracion" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Nueva instalacion de las herramientas de backup y restauracion" \
   2 "Actualizacion del directorio del repo" \
   3 "Reset del directorio del repo y descarga desde 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-backup
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-backup.git
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-backup
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "El directorio del repo no se ha detectado, no se puede proseguir."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-backup
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    fi
    clear;;
esac
clear

