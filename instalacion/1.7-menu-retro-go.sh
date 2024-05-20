#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 1.7-menu-retro-go.sh Usuario = $usuario ------------------" \
--title "G&W menu emulador Retro-Go" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "Nueva instalacion del emulador Retro-Go" \
   2 "Actualizacion del directorio del repo local de Retro-Go conectando al GitHub" \
   3 "Reset del directorio del repo y descarga desde 0" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-retro-go
    fi
    #sleep 5
    git clone --recurse-submodules https://github.com/sylverb/game-and-watch-retro-go
    sleep 2
    #Se comprueba si el directorio tama existe, si no existe se crea. Esto se hizo porque
	#cuando se incluyo el emulador tamagotchi no se creaba este directorio y habia error de compilacion
	#if [ ! -d /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama ]; then
    #    mkdir /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama
    #fi
    #cd game-and-watch-retro-go
    #antiguo metodo usado para instalar los paquetes requeridos. A partir de ubuntu 23.04 no se puede usar este metodo
    #pip3 install -r requirements.txt
    clear;;
  2)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        git pull --recurse-submodules
        #Se comprueba si el directorio tama existe, si no existe se crea. Esto se hizo porque
		#cuando se incluyo el emulador tamagotchi no se creaba este directorio y habia error de compilacion
		#if [ ! -d /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama ]; then
        #    mkdir /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama
        #fi
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    else
        echo "El directorio del repo no se ha detectado, no se puede proseguir."
    fi
    clear;;
  3)clear
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        git reset --hard
        git pull --recurse-submodules
        #Se comprueba si el directorio tama existe, si no existe se crea. Esto se hizo porque
		#cuando se incluyo el emulador tamagotchi no se creaba este directorio y habia error de compilacion
		#if [ ! -d /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama ]; then
        #    mkdir /home/$usuario/gameandwatch/game-and-watch-retro-go/roms/tama
        #fi
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    fi
    clear;;
esac
clear

