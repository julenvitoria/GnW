#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.1-backup-restauracion.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W menu backup/restauracion/liberacion" \
--msgbox "POR FAVOR LEER / MUY IMPORTANTE:\n\nDos normas son obligatorias:\n1ª - NUNCA desconectes el stlink del usb\n2ª - NUNCA BAJO NINGUN CONCEPTO sigas con el paso siguiente si el actual te dió error.\n\nEl proceso de liberación consta de 5 pasos. Cada uno se encarga de un proceso vital en la liberación y no se debe saltar al paso siguiente hasta haber completado el actual. En algunos pasos el ordenador nos dará instrucciones sobre como proceder. Es importante seguirlas tal y como se exponen. Ademas, en algunos momentos puede parecer que el proceso se ha parado pero no es así; algunos pasos pueden tardar hasta 5 minutos en completarse. NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos." 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo" \
--title "G&W menu backup/restauracion/liberacion" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Consola seleccionada: $consola

Selecciona con las flechas la opcion deseada:" 0 0 0 \
   1 "Sanity check: comprobacion de dependencias y elementos necesarios." \
   2 "Backup flash externa: realiza un backup de la flash SPI. No modifica el contenido." \
   3 "Backup de la flash interna: ATENCION: se modifica el contenido de la flash SPI del punto anterior. Puede tardar hasta 5 min" \
   4 "Desbloqueo de la consola: Desactiva la proteccion contra escritura. ATENCION: este proceso BORRA la flash del STM32" \
   5 "Restaurar el firmware original" \
   6 "Realizar copia de seguridad del firmware descargado" \
   7 "Borrar firmware descargado. ATENCION: realizar si se va a flashear una nueva G&W" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "G&W Sanity check" \
    --msgbox "Se realizará una comprobacion de los elementos necesarios." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./1_sanity_check.sh stlink $consola
    read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "G&W Sanity check" \
    --msgbox "Si el proceso ha devuelto un error volver a reinstalar el software desde el menu de instalacion." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Backup flash externa" \
    --msgbox "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./2_backup_flash.sh stlink $consola
    read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Backup flash externa" \
    --msgbox "Si el proceso ha devuelto un error e indica que no se puede conectar con la consola, manten pulsado el botón de encendido y repite el proceso." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Backup de la flash interna" \
    --msgbox "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./3_backup_internal_flash.sh stlink $consola
    read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Backup de la flash interna" \
    --msgbox "Si el proceso ha devuelto un error e indica que no se puede conectar con la consola, manten pulsado el botón de encendido y repite el proceso." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  4)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Desbloqueo de la consola" \
    --msgbox "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas." 0 0
    clear
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./4_unlock_device.sh stlink $consola
    read -n 1 -s -r -p "Proceso realizado. Presiona cualquier tecla para continuar"
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Desbloqueo de la consola" \
    --msgbox "Si el proceso ha devuelto un error e indica que no se puede conectar con la consola, manten pulsado el botón de encendido y repite el proceso." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  5)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Restaurar el firmware original" \
    --msgbox "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas." 0 0
    clear
    echo " "
    echo " "
    echo -e "\e[1;31mPor favor, apaga la consola, despues pulsa el boton de encendido y mantenlo pulsado durante unos segundos hasta que empiece el proceso de flasheo. Mientras mantienes el boton pulsa cualquier tecla para continuar y el proceso comenzara.\e[0m"
    read -n 1 -s -r -p ""
    cd /home/$usuario/gameandwatch/game-and-watch-backup
    ./5_restore.sh stlink $consola
    echo " "
    echo " "
    echo " "
    echo -e "\e[1;31mProceso realizado. Quita el conector de la bateria y vuelve a conectarla, despues enciende la consola. Deberia correr el firm original.\e[0m"
    echo " "
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Restaurar el firmware original" \
    --msgbox "Si el proceso ha devuelto un error e indica que no se puede conectar con la consola, manten pulsado el botón de encendido y repite el proceso." 0 0
    cd -
    ./scene/2.1-backup-restauracion.sh
    clear;;
  6)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Realizar copia de seguridad del firmware descargado" \
    --yesno "Se realizara una copia de seguridad de los archivos del firmware descargados de la consola a /home/$usuario/gameandwatch/firms/$consola. Dentro de ese directorio se creara un subdirectorio con fecha y hora del momento de ejecucion de este proceso. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "flash_backup_$consola.bin encontrado"
            sleep 1
            if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
                echo "internal_flash_backup_$consola.bin encontrado"
                sleep 1
                if [ -d /home/$usuario/gameandwatch/firms/ ]; then
                    if [ -d /home/$usuario/gameandwatch/firms/$consola ]; then
                        rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_mario.bin /home/$usuario/gameandwatch/firms/mario/$(date +%d-%m-%Y_%H:%M:%S)
                    else
                        mkdir /home/$usuario/gameandwatch/firms/$consola
                        rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_$consola.bin /home/$usuario/gameandwatch/firms/$consola/$(date +%d-%m-%Y_%H:%M:%S)
                    fi
                else
                    mkdir /home/$usuario/gameandwatch/firms
                    mkdir /home/$usuario/gameandwatch/firms/$consola
                    rsync -ab /home/$usuario/gameandwatch/game-and-watch-backup/backups/*_$consola.bin /home/$usuario/gameandwatch/firms/$consola/$(date +%d-%m-%Y_%H:%M:%S)
                 fi
                echo " "
                echo "Se han copiado los archivos de la flash interna y externa"
                echo " "
                sleep 2
            else
                echo "No se ha encontrado internal_flash_backup_$consola.bin, cancelando..."
                sleep 2
            fi
        else
            echo "No se ha encontrado flash_backup_$consola.bin, cancelando..."
            sleep 2
        fi
        #mkdir /home/$usuario/gameandwatch/firms/$(date +%d-%m-%Y_%H:%M:%S) | cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/*.bin /home/$usuario/gameandwatch/firms/$(date +%d-%m-%Y_%H:%M:%S)
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Realizar copia de seguridad del firmware descargado de Game&Watch $consola" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Realizar copia de seguridad del firmware descargado de Game&Watch $consola" \
        --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.1-backup-restauracion.sh
    clear;;
  7)clear
      dialog --backtitle "G&W $consola - Utilidades de flasheo" \
    --title "Borrar firmware descargado de Game&Watch $consola" \
    --yesno "Se realizara el borrado de los archivos del firmware descargados de la consola. SE RECOMIENDA ENCARECIDAMENTE tener copia de seguridad de dichos archivos. Los scripts no realizan la copia de seguridad de manera automatica por lo que se debera hacer de manera manual con la opcion 6 del menu \"Backup, restauracion y liberacion\". ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin ]; then
            echo "Borrando flash_backup.bin"
            rm /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_$consola.bin
        else
            echo "No se ha encontrado flash_backup_$consola.bin"
        fi
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin ]; then
            echo "Borrando internal_flash_backup.bin"
            rm /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_$consola.bin
         else
             echo "No se ha encontrado internal_flash_backup_$consola.bin"
        fi
        sleep 3
         dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Borrar firmware descargado de Game&Watch $consola" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo" \
        --title "Borrar firmware descargado de Game&Watch $consola" \
        --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.1-backup-restauracion.sh
    clear;;
esac
clear
