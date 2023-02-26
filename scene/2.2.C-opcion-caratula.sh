#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"
proc="4"
caratula="0"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.C-opcion-caratula.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola menu caratulas" \
--msgbox "Bienvenido al menu de opcion de flasheo  con caratulas. Elige simplemente activar o desactivar." 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------ INFO: 2.2.C-opcion-caratula.sh Usuario = $usuario   ////   Consola seleccionada = $consola   //// Opcion caratula = $caratula (0=NO y 1=SI) -----" \
--title "G&W $consola CFW + Retro-Go /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Opcion caratula=$caratula (0=NO y 1=SI)" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 14 140 15 \
   A "Activar el flasheo con caratulas de juegos" \
   D "Desactivar el flasheo con caratulas de juegos"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  A)clear
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.C-opcion-caratula.sh
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.C-opcion-caratula.sh Usuario = $usuario ------------------" \
    --title "G&W $consola menu caratulas" \
    --msgbox "Opcion caratulas ACTIVADA. NOTA:Para flashear caratulas de roms en el menú hará falta colocar en el mismo directorio de la rom un archivo jpg, bmp o png con el mismo nombre de la rom y el propio programa se encargara de comprimirla y subirla a la G&W." 0 0
    #sleep 5;;
	clear;;
  D)clear
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-mario.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.C-opcion-caratula.sh
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.C-opcion-caratula.sh Usuario = $usuario ------------------" \
    --title "G&W $consola menu caratulas" \
    --msgbox "Opcion caratulas DESACTIVADA. NOTA:Para flashear caratulas de roms en el menú hará falta colocar en el mismo directorio de la rom un archivo jpg, bmp o png con el mismo nombre de la rom y el propio programa se encargara de comprimirla y subirla a la G&W." 0 0
    #sleep 5;;
	clear;;
esac
clear
