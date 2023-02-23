#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

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
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: menu.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "Game&Watch - Menu ayuda para el flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 125 15 \
   1 "Cambio de usuario. IMPORTANTE: la primera vez es esencial ejecutar esto para el correcto funcionamiento" \
   2 "Cambio de modelo de consola (actual = $consola). IMPORTANTE: Escoge el modelo correcto para el correcto funcionamiento" \
   3 "Menu instalacion paquetes y programas necesarios y actualizacion del firm del STLINK" \
   4 "Menu scene: backup/restauracion/liberacion y flasheo custom firm con Retro-Go" \
   5 "Actualizar el repo local de estos scripts" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./instalacion/1.1-cambio-usuario.sh
    ./menu.sh
    clear;;
  2)clear
    ./instalacion/1.2-cambio-consola.sh
    ./menu.sh
    clear;;
  3)clear
    ./1-menu-instalacion.sh
    ./menu.sh
    clear;;
  4)clear
    ./2-menu-scene-$consola.sh
    ./menu.sh
    clear;;
  5)clear
    git reset --hard
    git pull --recurse-submodules
	sleep 1
    if [[ -n ["$usuario"] ]]; then
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.4-openocd.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.6-menu-flashloader.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.7-menu-retro-go.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.8-menu-patch.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.10-instalacion-completa.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.1-backup-restauracion.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.5-actualizacion-retro-go.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.6-actualizacion-parche.sh
		sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./menu.sh
	fi
	#read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
	if [ $consola = mario ]; then
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./1-menu-instalacion.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./2-menu-scene-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.1-backup-restauracion.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2-retro-go-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
		sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./menu.sh
    fi
	if [ $consola = zelda ]; then
	    sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./1-menu-instalacion.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./2-menu-scene-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.1-backup-restauracion.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2-retro-go-zelda.sh
		sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
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
