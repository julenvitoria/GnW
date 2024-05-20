#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"
proc="4"
caratula="1"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.6-cfw-retro-go-256mb-mario.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W CFW + Retro-Go 256MB /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Usuario actual: $usuario
Consola seleccionada: $consola
Opcion caratulas: $caratula (0=NO y 1=SI)
Roms: /home/$usuario/game-and-watch-retro-go/roms/

Selecciona con las flechas la opcion deseada:" 0 0 0 \
   H "Herramientas y utilidades" \
   1 "CFW con los parametros para 256MB" \
   2 "Compilar Retro-Go con los parametros para 256MB" \
   3 "Flashear Retro-Go con los parametros para 256MB" \
   4 "Descarga y restauracion de saves-states con parametros 256MB"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  H)clear
    ./scene/2.2.H-opcion-herramientas.sh
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    clear;;
  1)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Instalar Retro-Go en consola G&W $consola con 256MB" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Este proceso es solamente para una consola con el chip de 256MB instalado.\n\n¡¡¡ATENCION!!!\nSI SE TIENE DIFERENTE CANTIDAD DE MEMORIA CANCELAR EL PROCESO y una vez vuelto al menu seleccionar el correcto.\n\nSe flasheara un custom firmware que consta del menu original de la consola ademas del acceso al emulador Retro-Go. El emulador aparecera al realizar el combo de botones \"LEFT\" + \"GAME\". ¿Deseas continuar?" 0 0
    ans=$?
	deactivate
    source pypatch/bin/activate
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "flash_backup_$consola.bin encontrado"
            sleep 0.5
            if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
                echo "internal_flash_backup_$consola.bin encontrado"
                sleep 0.5
                cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin /home/$usuario/gameandwatch/game-and-watch-patch
                cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin /home/$usuario/gameandwatch/game-and-watch-patch
                echo " "
                echo "Se han copiado los archivos de la flash interna y externa"
                echo " "
                echo " "
                echo "Proceso 1/2 concluido."
                echo " "
                echo -e "\e[1;34mSi ejecutas esta opcion y te devuelve un error con el texto \"Unexpected response from debug probe. Unable to parse read_uint32 response\"\e[0m"
                echo -e "\e[1;34mdesconecta el stlink, vuelve a conectarlo y ejecuta de nuevo esta opcion.\e[0m"
                echo " "
                echo " "
                echo -e "\e[1;31mEnciende la consola y dejala en la pantalla del reloj. Despues pulsa cualquier tecla para continuar...\e[0m"
                read -n 1 -s -r -p ""
                clear
                cd /home/$usuario/gameandwatch/game-and-watch-patch
                make clean
                #make PATCH_PARAMS="--internal-only" flash_patched_int
                #make PATCH_PARAMS="--device=$consola --internal-only" flash_patched
                make PATCH_PARAMS="--device=$consola" LARGE_FLASH=1 flash_patched
                cd -
                echo " "
                echo " "
                echo "Proceso 2/2 concluido."
                read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
            else
                echo "No se ha encontrado internal_flash_backup_$consola.bin, cancelando..."
                sleep 2
            fi
        else
            echo "No se ha encontrado flash_backup_$consola.bin, cancelando..."
            sleep 2
        fi
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Instalar firmware original + Retro-Go  en consola con 64MB" \
        --msgbox "Proceso realizado." 0 0
    else
            dialog --backtitle "G&W $consola - Utilidades de flasheo" \
            --title "Instalar firmware original + Retro-Go  en consola con 64MB" \
            --msgbox "Proceso cancelado." 0 0
    fi
	deactivate
    source py/bin/activate
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Compilar Retro-Go" \
    --yesno "Se procedera a compilar RetroGo y se incluiran las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make clean
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=255 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula
        cd -
        echo " "
        echo " "
        read -n 1 -s -r -p "Proceso concluido. Presiona cualquier tecla para continuar."
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Compilar Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Compilar Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Flashear Retro-Go" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara  el emulador Retro-Go con las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla)\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=255 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash
        cd -
        echo " "
        echo " "
        read -n 1 -s -r -p "Proceso concluido. Presiona cualquier tecla para continuar."
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
    clear;;
  4)clear
    ./scene/2.2.4-save-state-$consola.sh
    ./scene/2.2.6-cfw-retro-go-256mb-$consola.sh
	clear;;
esac
clear
