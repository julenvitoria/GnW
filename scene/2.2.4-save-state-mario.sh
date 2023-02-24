#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"
proc="4"
caratula="1"

clear
dpkg -s libncurses5 > libncurses5.txt
if grep "install ok installed" ./libncurses5.txt ; then
        echo "Encontrado paquete libncurses5, se prosigue..."
        sleep 0.5
else
        echo "No encontrado paquete dialog necesario, instalando..."
        echo " "
        sudo apt install -y libncurses5
        echo " "
        echo "Instalado!!"
        sleep 0.5
fi

dialog --msgbox "G&W Utilidad para backup, resturacion y borrado de save states. Una vez descargados los save states estan ubicados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-mario.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 140 15 \
   1 "Hacer backup de los save states existentes en la G&W" \
   2 "Restaurar los save states desde el pc a la G&W " \
   3 "Borrar los saves states existentes en la G&W para dejarla limpia"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
	make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=63 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_backup
	cd -
	sleep 5
    dialog --msgbox "Save states descargados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  2)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
	make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=63 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_restore
	cd -
    sleep 5
	dialog --msgbox "Proceso concluido..." 0 0; sleep 2
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  3)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
	make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=63 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_erase
	cd -
    sleep 5
	dialog --msgbox "Proceso concluido..." 0 0; sleep 2
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
esac
clear
