#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 1.8-menu-patch.sh Usuario = $usuario ------------------" \
--title "G&W menu parche custom firmware para G&W" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Nueva instalacion del parche custom firmware" \
   2 "Actualizacion del directorio del repo" \
   3 "Reset del directorio del repo y descarga desde 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-patch
    fi
    #sleep 5
    git clone https://github.com/BrianPugh/game-and-watch-patch
    cd game-and-watch-patch
    pip3 install -r requirements.txt
    make download_sdk
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-patch
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "El directorio del repo no se ha detectado, no se puede proseguir."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-patch
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    fi
    clear;;
esac
clear

