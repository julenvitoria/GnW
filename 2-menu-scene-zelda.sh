#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

dialog --backtitle "G&W $consola - Utilidades de flasheo" \
--title "Game&Watch $consola - menu de flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 10 120 15 \
   1 "Backup, restauracion y liberacion de la G&W $consola" \
   2 "Instalacion Custom FirmWare (CFW) y RetroGo en G&W $consola" \
   3 "Generación roms Game&Watch" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./scene/2.1-backup-restauracion.sh
    ./2-menu-scene-$consola.sh
    clear;;
  2)clear
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2-retro-go-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.1-retro-go-1mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    sed -i 's/^proc=.*$/'proc=\""$(nproc)"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    ./2-menu-scene-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Generación roms Game&Watch" \
    --yesno "Coloca tus roms y artworks de Game&Watch que desees transformar\nIMPORTANTE: Para que el script funcione deberas tener en cuenta lo siguiente:\n-Las roms deben ser del romset 0.229 de Mame, en formato No-merged y deben ser colocadas en el directorio\n/home/$usuario/gameandwatch/LCD-Game-Shrinker/input/rom\n-Los artworks deben copiarse al directorio /home/$usuario/gameandwatch/LCD-Game-Shrinker/input/artwork\n-Ambos archivos (rom y artwork) deben estar en formato zip y deben tener el mismo nombre.\n\nRecuerda: las roms convertidas las encontraras en home/$usuario/gameandwatch/LCD-Game-Shrinker/output" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker/
        python3 shrink_it.py
        cd -
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "Proceso cancelado"
		read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    fi
    ./2-menu-scene-$consola.sh
    clear;;
esac
clear
