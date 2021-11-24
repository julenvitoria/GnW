#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W - Utilidades de flasheo" \
--title "G&W menu reductor para juegos LCD de Mame (LCD-Game-Shrinker)" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Nueva instalacion del reductor para juegos LCD de Mame (LCD-Game-Shrinker)" \
   2 "Actualizacion del directorio del repo" \
   3 "Reset del directorio del repo y descarga desde 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        sudo rm -R /home/$usuario/gameandwatch/LCD-Game-Shrinker
    fi
    #sleep 5
    git clone https://github.com/bzhxx/LCD-Game-Shrinker
    sudo apt update
    sudo apt install -y snapd libopenjp2-7 libtiff5 libxslt-dev libatlas-base-dev
    sudo snap install core
    sudo snap install inkscape
    cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
    pip3 install -r requirements.txt
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "El directorio del repo no se ha detectado, no se puede proseguir."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
        git reset --hard
        git pull --recurse-submodules
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    fi
    clear;;
esac
clear
