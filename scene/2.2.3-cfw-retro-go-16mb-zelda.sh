#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
proc="6"
caratula="0"

#dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.3-cfw-retro-go-16mb-zelda.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
#--title "G&W menu de flasheo $consola 16MB" \
#--msgbox "ATENCION:\n\n\nCFW \"slim\" significa que no habra cancion de mario, no habra imagenes a la hora de dormir, se comprimira el resto del firm y se usara un flash interno indocumentado que requiere el openocd modificado. Esto permite que todo el firmware funcione sin utilizar ningún flash externo.\n\nCFW \"NO slim\" significa que se flasheara todo el firmware completo por lo que se usará parte de la flash externa con lo cual que se podran meter menos roms.\nPor contra se obtienen ciertos beneficios que son: tener la cancion de mario, las imagenes de dormir y se gestionarán mejor la configuracion y los highscores porque con CFW \"slim\" se pierden cuando la bateria esta baja o desenchufada" 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo" \
--title "G&W CFW + Retro-Go 16MB /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Usuario actual: $usuario
Consola seleccionada: $consola
Opcion caratulas: $caratula (0=NO y 1=SI)
Roms: /home/$usuario/game-and-watch-retro-go/roms/

Selecciona con las flechas la opcion deseada:" 0 0 0 \
   1 "CFW con los parametros para 16MB" \
   2 "Compilar Retro-Go para CFW y parametros 16MB" \
   3 "Flashear Retro-Go para CFW y parametros 16MB" \
   4 "Descarga y restauracion de saves-states con parametros 16MB"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Instalar CFW slim en G&W $consola con 16MB" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Este proceso es solamente para una consola con el chip de 16MB instalado.\n\n¡¡¡ATENCION!!!\nSI SE TIENE DIFERENTE CANTIDAD DE MEMORIA CANCELAR EL PROCESO y una vez vuelto al menu seleccionar el correcto.\n\nSe flasheara un custom firmware que consta del menu original de la consola ademas del emulador Retro-Go. El emulador aparecera al realizar el combo de botones \"LEFT\" + \"GAME\". Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola ¿Deseas continuar?" 0 0
    ans=$?
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
                echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
                echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
                echo " "
                echo " "
                echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\e[0m"
                read -n 1 -s -r -p ""
                clear
                cd /home/$usuario/gameandwatch/game-and-watch-patch
                make clean
                make PATCH_PARAMS="--device=$consola" flash_patched
                sleep 0.5
                make reset
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
        --title "Instalar CFW en G&W $consola con 16MB" \
        --msgbox "Proceso realizado." 0 0
    else
            dialog --backtitle "G&W $consola - Utilidades de flasheo" \
            --title "Instalar firmware original + Retro-Go  en consola con 16MB" \
            --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Compilar Retro-Go" \
    --yesno "Se procedera a compilar RetroGo con los parametros de memoria de 16mb pata CFW slim y se incluiran las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make clean
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=12 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula
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
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Instalar Retro-Go" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
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
        #make clean
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=12 EXTFLASH_OFFSET=4194304 INTFLASH_BANK=2 GNW_TARGET=$consola COVERFLOW=$caratula flash
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
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
    clear;;
  4)clear
    ./scene/2.2.3-save-state-$consola.sh
    ./scene/2.2.3-cfw-retro-go-16mb-$consola.sh
	clear;;
esac
clear
