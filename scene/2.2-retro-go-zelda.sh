#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="4"
caratula="0"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2-retro-go-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola menu Retro-Go + custom firmware" \
--msgbox "El proceso de flasheo se puede realizar de diferentes maneras, elige la mas conveniente a tu hardware. Si se ha cambiado el chip de memoria deberas haber restaurado el firmware original en la opcion 5 del menu \"scene>backup, restauracion y liberacion de la consola\". NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos." 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------- INFO: 2.2-retro-go-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola    ////    Opcion caratula=$caratula (0=NO y 1=SI) -------" \
--title "G&W $consola CFW + Retro-Go /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Usuario actual: $usuario
Consola seleccionada: $consola
Opcion caratulas: $caratula (0=NO y 1=SI)

Selecciona con las flechas la opcion deseada:" 0 0 0 \
   C "Opcion flasheo con caratula. Actualmente:$caratula (0=NO y 1=SI)" \
   1 "4MB, 16MB y 64MB sin CFW: Menu flasheo solo Retro-Go + backup/restauracion save states en consola G&W $consola" \
   2 "4MB: Menu CFW + Retro-Go + backup/restauracion save states en consola G&W $consola original" \
   3 "16MB: Menu CFW + Retro-Go + backup/restauracion save states en consola G&W $consola" \
   4 "64MB: Menu CFW + Retro-Go + backup/restauracion save states en consola G&W $consola" \
   5 "128MB: Menu CFW + Retro-Go + backup/restauracion save states en consola G&W $consola" \
   6 "256MB: Menu CFW + Retro-Go + backup/restauracion save states en consola G&W $consola" \
   R "Actualizacion del directorio del repo local de Retro-Go"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  C)clear
    ./scene/2.2.C-opcion-caratula.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  1)clear
    ./scene/2.2.1-solo-retro-go-$consola.sh
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
    ./scene/2.2.5-cfw-retro-go-128mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  6)clear
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
  R)clear
    ./scene/2.2.R-actualizacion-retro-go.sh
    ./scene/2.2-retro-go-$consola.sh
    clear;;
esac
clear
