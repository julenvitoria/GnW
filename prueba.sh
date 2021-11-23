#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

dialog --backtitle "G&W menu Retro-Go + custom firmware" \
--title "Instalar firmware original + Retro-Go  en consola con 1MB" \
--yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Este proceso es solamente para una consola con el chip de 1MB instalado (chip original).\n\n¡¡¡ATENCION!!!\nSI SE TIENE DIFERENTE CANTIDAD DE MEMORIA CANCELAR EL PROCESO y una vez vuelto al menu seleccionar el correcto.\n\nSe flasheara un custom firmware que consta del menu original de la consola ademas del emulador Retro-Go. El emulador aparecera al realizar el combo de botones \"LEFT\" + \"GAME\". Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola ¿Deseas continuar?" 0 0
ans=$?
if [ $ans -eq 0 ]; then
    clear
    if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/flash_backup_mario.bin ]; then
        echo "flash_backup.bin encontrado"
        sleep 1
        if [ -f /home/$usuario/gameandwatch/game-and-watch-backup/backups/internal_flash_backup_mario.bin ]; then
            echo "internal_flash_backup.bin encontrado"
            sleep 1
            cp /home/$usuario/gameandwatch/game-and-watch-backup/backups/*.bin /home/$usuario/gameandwatch/game-and-watch-patch
            echo "Se procedera a restaurar el firm para poder realizar todo el proceso"
            cd /home/$usuario/gameandwatch/game-and-watch-backup
            ./5_restore.sh stlink
            read -n 1 -s -r -p "Proceso 1/3 concluido. Presiona cualquier tecla para continuar."
            dialog --backtitle "G&W menu Retro-Go + custom firmware" \
            --title "Instalar firmware original + Retro-Go  en consola con 1MB" \
            --yesno "Se realizo el proceso de restauracion. ¿Consiguio restaurar el firm?" 0 0
            ans=$?
            if [ $ans -eq 0 ]; then
                clear
                cd /home/$usuario/gameandwatch/game-and-watch-patch
                make clean
                make PATCH_PARAMS="--internal-only" flash_patched_int
                cd -
                read -n 1 -s -r -p "Proceso 2/3 concluido. Presiona cualquier tecla para continuar."
                cd /home/$usuario/gameandwatch/game-and-watch-retro-go
                make clean
                make -j$(nproc) COMPRESS=lzma INTFLASH_BANK=2 flash
                cd -
                read -n 1 -s -r -p "Proceso 3/3 concluido. Presiona cualquier tecla para continuar."
            else
            dialog --backtitle "G&W menu Retro-Go + custom firmware" \
            --title "Instalar firmware original + Retro-Go  en consola con 1MB" \
            --msgbox "Cancelando..." 0 0
            fi
        else
            echo "No se ha encontrado internal_flash_backup.bin, cancelando..."
            sleep 2
        fi
    else
        echo "No se ha encontrado flash_backup_mario.bin, cancelando..."
        sleep 2
    fi
    dialog --backtitle "G&W menu Retro-Go + custom firmware" \
    --title "Instalar firmware original + Retro-Go  en consola con 1MB" \
    --msgbox "Proceso realizado." 0 0
else
        dialog --backtitle "G&W menu Retro-Go + custom firmware" \
        --title "Instalar firmware original + Retro-Go  en consola con 1MB" \
        --msgbox "Proceso cancelado." 0 0
fi