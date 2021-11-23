#!/bin/bash

usuario="kde"

#Tras la instalación del nuevo chip lo primero que debemos de hacer es conectar la consola al programador STLINK o RPI y hacer una restauración del firmware stock, para comprobar que el chip funciona y el proceso de flash es valido.

cd /home/$usuario/gameandwatch/game-and-watch-backup
./5_restore.sh stlink/rpi

#Una vez reinstalado el chip, flasheado el backup para ver que todo esta correcto procedemos a instalar primero el custom firware de Brian Pugh y posteriormente flashear nuestra compilación de Retro-GO.
#Primero instalamos el custom firmware.

cd /home/$usuario/gameandwatch/game-and-watch-patch
make clean
make flash_patched_ext
#--- AQUÍ LA CONSOLA EMPEZARÁ EL PRIMER PROCESO DE FLASHEO (QUITAMOS EL PARÁMETRO PATCH-PARAMS="--slim" ya que ahora nos sobra espacio en la flash) ---
make flash_patched_int
#--- AQUÍ SE REALIZARÁ EL SEGUNDO FLASHEO (QUITAMOS EL PARÁMETRO PATCH-PARAMS="--slim" ya que ahora nos sobra espacio en la flash) ---

#Tras instalar el custom firmware procedemos a instalar nuestra compilación de Retro-Go con algunos parámetros modificados para la flash de 16MB.

cd /home/$usuario/gameandwatch/game-and-watch-retro-go
make clean
make -j$(nproc) COMPRESS=lzma EXTFLASH_SIZE_MB=63 EXTFLASH_OFFSET=1048576 INTFLASH_BANK=2 flash

