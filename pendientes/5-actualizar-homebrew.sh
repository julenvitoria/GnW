#!/bin/bash

git pull --recurse-submodules

#Este comando debe introducirse en la carpeta/programa que quieres actualizar. Por ejemplo, para actualizar Retro-go, se debe escribir lo siguiente:

cd~
cd opt
cd game-and-watch-retro-go
git pull --recurse-submodules

#Este emulador está en constante desarrollo y cada pocos días va incorporando novedades. Para actualizar el game-and-watch-retro-go sin perder la carpeta de roms debes hacer lo siguiente:

cd ~
cd opt
cd game-and-watch-retro-go
make clean
git pull --recurse-submodules

#Si por casualidad haz hecho algún cambio en el código no te va a permitir aplicar los cambios. En este caso debes hacer lo siguiente (de nuevo, se usa Retro-go como ejemplo):

cd game-and-watch-retro-go
git reset --hard
git pull --recurse-submodules