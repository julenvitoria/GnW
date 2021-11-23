#!/bin/bash

usuario="kde"

#instalacion del conversor de roms de g&w

sudo apt update
sudo apt install snapd libopenjp2-7 libtiff5 libxslt-dev libatlas-base-dev
sudo snap install core
sudo snap install inkscape
cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
pip3 install -r requirements.txt

#Installing collected packages: lxml, entrypoint2, easyprocess, svgutils, pyunpack, patool, numpy, lz4
#  WARNING: The scripts f2py, f2py3 and f2py3.9 are installed in '/home/kde/.local/bin' which is not on PATH.
#  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
#Successfully installed easyprocess-0.3 entrypoint2-0.2.4 lxml-4.6.4 lz4-3.1.3 numpy-1.21.4 patool-1.12 pyunpack-0.2.2 svgutils-0.3.4
