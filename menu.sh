#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$

clear
which dialog > dialog.txt
if grep "/dialog" ./dialog.txt ; then
        echo "Encontrado paquete dialog, se prosigue..."
        sleep 0.5
else
        echo "No encontrado paquete dialog necesario, instalando..."
        echo " "
        sudo apt install -y dialog
        echo " "
        echo "Instalado!!"
        sleep 0.5
fi
clear
dialog --backtitle "Game&Watch  - Menu ayuda para el flasheo" \
--title "Game&Watch - Menu ayuda para el flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 10 120 15 \
   1 "Menu instalacion paquetes y programas necesarios y actualizacion del firm del STLINK" \
   2 "Menu scene: backup/restauracion/liberacion y flasheo custom firm con Retro-Go" \
   3 "Actualizar el repo local de estos scripts" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./1-menu-instalacion.sh
    ./menu.sh
    clear;;
  2)clear
    ./2-menu-scene.sh
    ./menu.sh
    clear;;
  3)clear
    git reset --hard
    git pull --recurse-submodules
    read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    ./menu.sh
    clear;;
esac
clear
