#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="6"
caratula="1"

clear
dpkg -s libncurses5 > libncurses5.txt
if grep "install ok installed" ./libncurses5.txt ; then
        echo "Encontrado paquete libncurses5, se prosigue..."
        sleep 0.5
else
        echo "No encontrado paquete dialog necesario, instalando..."
        echo " "
        sudo apt update
        sudo apt install -y libncurses5
        echo " "
        echo "Instalado!!"
        sleep 0.5
fi

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
       --msgbox "G&W Utilidad para backup, resturacion y borrado de save states. Una vez descargados los save states estan ubicados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
       --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
       --ok-label Apply \
       --cancel-label Exit \
       --menu "
Usuario actual: $usuario
Consola seleccionada: $consola
Opcion caratulas: $caratula (0=NO y 1=SI)
Save states: /home/$usuario/game-and-watch-retro-go/save_states/

Selecciona con las flechas la opcion deseada:" 0 0 0 \
          1 "Hacer backup de los save states existentes que hay en la G&W con chip de 64MB, 128MB o 256MB" \
          2 "Restaurar los save states desde el pc a la G&W con chip de 64MB, 128MB o 256MB" \
          3 "Borrar los saves states existentes en la G&W con chip de 64MB, 128MB o 256MB para dejarla limpia"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
           --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "¡¡¡ATENCION!!! El proceso de BACKUP de los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la G&W y pararlo puede ocasionar errores. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mEnciende la consola y entra al menu Retro-Go con los botones LEFT+GAME y dejala esperando en el listado de las roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPara continuar con el proceso pulsa cualquier tecla...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=60 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_backup
        cd -
        echo -e "\e[1;31mPulsa cualquier tecla para continuar...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso realizado. Save states descargados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
           --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "¡¡¡ATENCION!!! El proceso RESTAURACION de los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la G&W y pararlo puede ocasionar errores. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mEnciende la consola y entra al menu Retro-Go con los botones LEFT+GAME y dejala esperando en el listado de las roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPara continuar con el proceso pulsa cualquier tecla...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=60 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_restore
        cd -
        echo -e "\e[1;31mPulsa cualquier tecla para continuar...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
           --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --yesno "¡¡¡ATENCION!!! El proceso BORRAR los save states puede llegar a tardar varios minutos dependiendo de la cantidad de roms que haya en la G&W y pararlo puede ocasionar errores. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mEnciende la consola y entra al menu Retro-Go con los botones LEFT+GAME y dejala esperando en el listado de las roms.\e[0m"
        echo ""
        echo -e "\e[1;31mPara continuar con el proceso pulsa cualquier tecla...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=60 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash_saves_erase
        cd -
        echo -e "\e[1;31mPulsa cualquier tecla para continuar...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.4-save-state-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
               --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
               --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  4)clear
    ./scene/exportar_srm.sh
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
  5)clear
    ./scene/importar_srm.sh
    ./scene/2.2.4-save-state-$consola.sh
    clear;;
esac
clear
