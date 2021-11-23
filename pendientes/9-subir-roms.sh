#!/bin/bash

#Dentro de la carpeta game-and-watch-retro-go/roms hay diferentes carpetas, cada una para un sistema. 

usuario="kde"

cd /home/$usuario/gameandwatch/game-and-watch-retro-go
make -j$(nproc) COMPRESS=lzma flash 

#Justo cuando empiece el proceso de flasheo se recomienda pulsar el botón power de la consola; no es imprescindible pero ayuda si el proceso no se inicia correctamente.