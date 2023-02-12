#!/bin/bash
#By julenvitoria

usuario="kde"

clear
#Descarga del sitio original y descomprime el .deb
wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
unzip openocd-git.deb.zip
sudo dpkg -i openocd-git_*_amd64.deb
sudo apt-get -y -f install
rm openocd*
#echo export OPENOCD=/opt/openocd-git/bin/openocd >>~/.bashrc
if grep -q "export OPENOCD=\"/opt/openocd-git/bin/openocd\"" /home/$usuario/.bashrc ; then
        echo "export OPENOCD=\"/opt/openocd-git/bin/openocd\" esta ya en el bashrc"
else
        echo "export OPENOCD=\"/opt/openocd-git/bin/openocd\" no esta aun en el bashrc, añadiendo..."
        sleep 2
        echo export OPENOCD=\"/opt/openocd-git/bin/openocd\" >>/home/$usuario/.bashrc
fi

export OPENOCD="/opt/openocd-git/bin/openocd"
sleep 3
