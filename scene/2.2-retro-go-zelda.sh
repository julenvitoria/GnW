#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="2"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2-retro-go-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola menu Retro-Go + custom firmware" \
--msgbox "El proceso de flasheo se puede realizar de diferentes maneras, elige la mas conveniente a tu hardware. Si se ha cambiado el chip de memoria deberas haber restaurado el firmware original en la opcion 5 del menu \"scene>backup, restauracion y liberacion de la consola\". NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos." 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2-retro-go-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola CFW + Retro-Go /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 14 140 15 \
   1 "Subir solo Retro-Go en consola de 4MB sin CFW" \
   2 "Menu CFW + Retro-Go en consola G&W $consola original 4MB" \
   3 "Menu CFW + Retro-Go en consola G&W $consola con 16MB" \
   4 "Menu CFW + Retro-Go en consola G&W $consola con 64MB" \
   5 "Actualizacion del directorio del repo local de Retro-Go" \
   6 "Actualizacion del directorio del parche para el CFW"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./scene/2.2.1-retro-go-4mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  2)clear
    ./scene/2.2.2-cfw-retro-go-4mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  3)clear
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  4)clear
    ./scene/2.2.4-cfw-retro-go-64mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  5)clear
    ./scene/2.2.5-actualizacion-retro-go.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  6)clear
    ./scene/2.2.6-actualizacion-parche.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
esac
clear
