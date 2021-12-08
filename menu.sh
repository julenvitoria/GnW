#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"

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
    ./2-menu-scene-$consola.sh
    ./menu.sh
    clear;;
  3)clear
    git reset --hard
    git pull --recurse-submodules
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.4-openocd.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.6-menu-flashloader.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.7-menu-retro-go.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.8-menu-patch.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./instalacion/1.10-instalacion-completa.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./2-menu-scene-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.1-backup-restauracion.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-retro-go-1mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.1-retro-go-4mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.5-actualizacion-retro-go.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./scene/2.2.6-actualizacion-parche.sh
    sed -i 's/^usuario=.*$/'usuario=\""$varname"\"'/g' ./menu.sh
	if [ $consola = mario ]; then
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./1-menu-instalacion.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./2-menu-scene-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.1-backup-restauracion.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2-retro-go-mario.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-retro-go-1mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./menu.sh
		read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    fi
	if [ $consola = zelda ]; then
	    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./1-menu-instalacion.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./2-menu-scene-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.1-backup-restauracion.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2-retro-go-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-retro-go-4mb-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./menu.sh
	fi
	read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
	./menu.sh
    clear;;
esac
clear
