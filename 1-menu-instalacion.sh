#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
consola="mario"

clear
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 1-menu-instalacion.sh Consola seleccionada = $consola ------------------" \
--title "Game & Watch - Menu de utilidades de flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 18 125 15 \
   1 "Preparacion del sistema: update+upgrade+instalacion de paquetes (requerido si no se ha hecho antes)" \
   2 "Instalacion OpenOCD" \
   3 "Instalacion/Actualizacion del repo de las herramientas backup y restauracion" \
   4 "Instalacion/Actualizacion del repo del flashloader" \
   5 "Instalacion/Actualizacion del repo del emulador Retro-Go" \
   6 "Instalacion/Actualizacion del repo del parche custom firmware para G&W Super Mario" \
   7 "Instalacion/Actualizacion del repo del reductor para juegos LCD de Mame (LCD-Game-Shrinker)" \
   8 "Instalacion de todo el software en un paso (ATENCION: es mas rapido pero puedes no ver algun error)" \
   9 "Actualizador del firmware del STLINK v2" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./instalacion/1.3-preparacion-sistema.sh
    ./1-menu-instalacion.sh
    clear;;
  2)clear
    ./instalacion/1.4-openocd.sh
    ./1-menu-instalacion.sh
    clear;;
  3)clear
    ./instalacion/1.5-menu-backup-restore-tools.sh
    ./1-menu-instalacion.sh
    clear;;
  4)clear
    ./instalacion/1.6-menu-flashloader.sh
    ./1-menu-instalacion.sh
    clear;;
  5)clear
    ./instalacion/1.7-menu-retro-go.sh
    ./1-menu-instalacion.sh
    clear;;
  6)clear
    ./instalacion/1.8-menu-patch.sh
    ./1-menu-instalacion.sh
    clear;;
  7)clear
    ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
    ./1-menu-instalacion.sh
    clear;;
  8)clear
    ./instalacion/1.10-instalacion-completa.sh
    ./1-menu-instalacion.sh
    clear;;
  9)clear
    ./instalacion/1.11-actualizador-firmware.sh
    ./1-menu-instalacion.sh
    clear;;esac
clear
