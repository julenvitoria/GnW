#!/bin/bash

usuario="kde"

cd /home/$usuario/gameandwatch/game-and-watch-backup
./1_sanity_check.sh
./2_backup_flash.sh stlink
./3_backup_internal_flash.sh stlink
./4_unlock_device.sh stlink
./5_restore.sh stlink

#Una vez realizados estos pasos, la consola debería estar liberada. Si durante alguno de los pasos os da error y os indica que no se puede conectar con la consola, mantened pulsado el botón de encendido durante el proceso. Recordad además hacer una copia de los archivos del firmware de la consola que se han creado en la carpeta backups (internal_flash_backup.bin y flash_backup.bin). Os vendrán bien si luego queréis generar un firmware personalizado.