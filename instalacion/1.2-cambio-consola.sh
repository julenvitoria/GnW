#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$

dialog --backtitle "G&W $consola - Utilidades de flasheo" \
--title "G&W menu de cambio de consola" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Mario 35th aniversary" \
   2 "Zelda" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./1-menu-instalacion.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./2-menu-scene-mario.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.1-backup-restauracion.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
	sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./menu.sh
    echo "Opcion mario aplicada"
    sleep 2
    clear;;
  2)clear
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./1-menu-instalacion.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./2-menu-scene-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.1-backup-restauracion.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-retro-go-4mb-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./menu.sh
    echo "Opcion zelda aplicada"
    sleep 2
    clear;;
esac
clear