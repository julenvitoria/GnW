#!/bin/bash

usuario="kde"

#El programa lo que hace es parchear el firmware original de la consola antes de flashearlo. Por esto, necesitamos la copia de seguridad de nuestra consola que creamos en el paso Desbloqueando la G&W. Estos archivos están en la carpeta backups de /game-and-watch-backup y se llaman internal_flash_backup.bin y flash_backup.bin
#Cuando hayamos localizado estos archivos debemos copiarlos en la raiz de la carpeta game-and-watch-patch para poder iniciar el proceso de flasheo.

cd /home/$usuario/gameandwatch/game-and-watch-patch
make clean
make PATCH_PARAMS="--internal-only" flash_patched_int

#--- AQUÍ LA CONSOLA EMPEZARÁ EL PRIMER PROCESO DE FLASHEO ---
cd /home/$usuario/gameandwatch/game-and-watch-retro-go
make clean
make -j$(nproc) COMPRESS=lzma INTFLASH_BANK=2 flash

#--- CON ESTE COMANDO COMENZARÁ UN NUEVO PROCESO DE FLASHEO ---

#Tras terminar de flashear se recomienda desconectar la batería y volver a encenderla.

#En ocasiones el proceso del primer flasheo no se puede iniciar y siempre da error. Se recomienda en este caso instalar el firmware original de la consola ejecutando el punto 5 del game-and-watch-backup y luego proceder con el flasheo.

cd /home/$usuario/gameandwatch/game-and-watch-backup
./5_restore.sh stlink/rpi