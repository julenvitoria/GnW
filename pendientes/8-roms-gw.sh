#!/bin/bash

#En primer lugar hace falta la rom de Game&Watch que queramos transformar. Debe ser una rom del romset 0.229 de Mame, en formato No-merged.
#Por otro lado se necesitan los artworks para Game&Watch de hydef o de DarthMarino. Por cuestiones legales no se pueden enlazar en esta wiki, pero son fáciles de encontrar por la web.
#Una vez tenemos ambos archivos, debemos copiar la rom de mame en la carpeta input/rom/ y el artwork en la carpeta input/artwok/. Ambos archivos deben estar en formato zip y deben tener el mismo nombre.

usuario="kde"

cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
python3 shrink_it.py