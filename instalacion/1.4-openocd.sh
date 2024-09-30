#!/bin/bash
#By julenvitoria

usuario="kde"

clear
#Descarga del sitio original y descomprime el .deb
#wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
#Descomprimimos el .deb que tenemos descargado de nuestro propio github y lo instalamos
cd /home/$usuario/GnW/recursos
unzip openocd-git.deb.zip
sudo dpkg -i openocd-git_*_amd64.deb
sudo apt-get -y -f install
rm openocd*
cd -
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

dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Usuario = $usuario ------------------------" \
       --title "INFO: Usuario=$usuario ---------- Instalacion openocd" \
       --yesno "¡¡¡ATENCION!!! Se recomienda realizar un reinicio despues de instalar OPENOCD para asegurar que todo funcione correctamente. Si no lo realizas ahora recuerda hacerlo mas tarde. ¿Deseas reiniciar el sistema?" 0 0
    ans=$?
if [ $ans -eq 0 ]; then
    clear
    dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Usuario = $usuario ------------------------" \
           --title "INFO: Usuario=$usuario ---------- Instalacion openocd" \
           --infobox "Reiniciando el sistema..." 0 0 ; sleep 2
    sudo reboot
else
    dialog --backtitle "G&W ------------------------- INFO: 1.4-openocd.sh -------------------------- Usuario = $usuario ------------------------" \
           --title "INFO: Usuario=$usuario ---------- Instalacion openocd" \
           --infobox "Recuerda realizar el reinicio mas tarde :)" 0 0 ; sleep 2
fi
