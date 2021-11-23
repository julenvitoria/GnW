#!/bin/bash
#By julenvitoria

usuario="kde"

clear
#which p7zip > p7zip.txt
#if grep "/p7zip" ./p7zip.txt ; then
#        echo "Encontrado paquete p7zip, se prosigue..."
#        sleep 1
#else
#        echo "No encontrado paquete p7zip necesario, instalando..."
#        echo " "
#        sudo apt install -y p7zip
#        echo " "
#        echo "Instalado!!"
#  sleep 1
#fi
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y binutils-arm-none-eabi python3 libhidapi-hidraw0 libftdi1 libftdi1-2 git python3-pip
clear
echo "ATENCION: el cambio de usuario es MUY IMPORTANTE para el correcto funcionamiento de los scripts."
echo "¡¡¡Si no se ha realizado correctamente los scripts no funcionaran correctamente!!!"
echo " "
echo "Por favor, indicame si realizaste el cambio de usuario con la opcion 1 del menu..."
echo " "
echo -n "Si realizaste el cambio presiona presiona S para continuar, si no lo hiciste cualquier otra tecla:"
read -n 1 confirm
echo
if [ "$confirm" = "s" ]; then
    confirm="S"
    echo " "
    echo "Se continua con la instalacion..."
    sleep 2
    cd /home/$usuario
    if [ -d /home/$usuario/gameandwatch ]; then
        echo "Ya existe el directorio gameandwatch"
        sleep 2
    else
        echo "Creando directorio gameandwatch"
        sleep 2
        mkdir /home/$usuario/gameandwatch
    fi
    if [ -d /home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major ]; then
        echo "Borrando directorio existente y volviendo a descargar..."
        sudo rm -R /home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major
    fi
    cd /home/$usuario/gameandwatch
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
    tar xvf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
    rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
    export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/
    if grep -q "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/" /home/$usuario/.bashrc ; then
            echo "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ esta ya en el bashrc"
    else
            echo "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ no esta aun en el bashrc, añadiendo..."
            sleep 2
            echo export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ >>/home/$usuario/.bashrc
    fi
    wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
    unzip openocd-git.deb.zip
    sudo dpkg -i openocd-git_*_amd64.deb
    sudo apt-get -y -f install
    rm openocd-git*
    #echo export OPENOCD=/opt/openocd-git/bin/openocd >>~/.bashrc
    if grep -q "export OPENOCD=/opt/openocd-git/bin/openocd" /home/$usuario/.bashrc ; then
            echo "export OPENOCD=/opt/openocd-git/bin/openocd esta ya en el bashrc"
    else
            echo "export OPENOCD=/opt/openocd-git/bin/openocd no esta aun en el bashrc, añadiendo..."
            sleep 2
            echo export OPENOCD=/opt/openocd-git/bin/openocd >>/home/$usuario/.bashrc
    fi
    export OPENOCD="/opt/openocd-git/bin/openocd"
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-backup
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-backup.git
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-flashloader
    fi
    #sleep 5
    git clone https://github.com/ghidraninja/game-and-watch-flashloader.git
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-retro-go
    fi
    #sleep 5
    git clone --recurse-submodules https://github.com/kbeckmann/game-and-watch-retro-go
    cd game-and-watch-retro-go
    pip3 install -r requirements.txt
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
        sudo rm -R /home/$usuario/gameandwatch/game-and-watch-patch
    fi
    #sleep 5
    git clone https://github.com/BrianPugh/game-and-watch-patch
    cd game-and-watch-patch
    pip3 install -r requirements.txt
    make download_sdk
    cd /home/$usuario/gameandwatch
    if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
        sudo rm -R /home/$usuario/gameandwatch/LCD-Game-Shrinker
    fi
    #sleep 5
    git clone https://github.com/bzhxx/LCD-Game-Shrinker
    sudo apt update
    sudo apt install snapd libopenjp2-7 libtiff5 libxslt-dev libatlas-base-dev
    sudo snap install core
    sudo snap install inkscape
    cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
    pip3 install -r requirements.txt
else
    if [ "$confirm" = "S" ]; then
        confirm="S"
        echo " "
        echo "Se continua con la instalacion..."
        sleep 2
        cd /home/$usuario
        if [ -d /home/$usuario/gameandwatch ]; then
            echo "Ya existe el directorio gameandwatch"
            sleep 2
        else
            echo "Creando directorio gameandwatch"
            sleep 2
            mkdir /home/$usuario/gameandwatch
        fi
        if [ -d /home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major ]; then
            echo "Borrando directorio existente y volviendo a descargar..."
            sudo rm -R /home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major
        fi
        cd /home/$usuario/gameandwatch
        wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
        tar xvf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
        rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
        export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/
        if grep -q "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/" /home/$usuario/.bashrc ; then
                echo "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ esta ya en el bashrc"
        else
                echo "export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ no esta aun en el bashrc, añadiendo..."
                sleep 2
                echo export GCC_PATH=/home/$usuario/gameandwatch/gcc-arm-none-eabi-10-2020-q4-major/bin/ >>/home/$usuario/.bashrc
        fi
        wget https://nightly.link/kbeckmann/ubuntu-openocd-git-builder/workflows/docker/master/openocd-git.deb.zip
        unzip openocd-git.deb.zip
        sudo dpkg -i openocd-git_*_amd64.deb
        sudo apt-get -y -f install
        rm openocd-git*
        #echo export OPENOCD=/opt/openocd-git/bin/openocd >>~/.bashrc
        if grep -q "export OPENOCD=/opt/openocd-git/bin/openocd" /home/$usuario/.bashrc ; then
                echo "export OPENOCD=/opt/openocd-git/bin/openocd esta ya en el bashrc"
        else
                echo "export OPENOCD=/opt/openocd-git/bin/openocd no esta aun en el bashrc, añadiendo..."
                sleep 2
                echo export OPENOCD=/opt/openocd-git/bin/openocd >>/home/$usuario/.bashrc
        fi
        export OPENOCD="/opt/openocd-git/bin/openocd"
        cd /home/$usuario/gameandwatch
        if [ -d /home/$usuario/gameandwatch/game-and-watch-backup ]; then
            sudo rm -R /home/$usuario/gameandwatch/game-and-watch-backup
        fi
        #sleep 5
        git clone https://github.com/ghidraninja/game-and-watch-backup.git
        cd /home/$usuario/gameandwatch
        if [ -d /home/$usuario/gameandwatch/game-and-watch-flashloader ]; then
            sudo rm -R /home/$usuario/gameandwatch/game-and-watch-flashloader
        fi
        #sleep 5
        git clone https://github.com/ghidraninja/game-and-watch-flashloader.git
        cd /home/$usuario/gameandwatch
        if [ -d /home/$usuario/gameandwatch/game-and-watch-retro-go ]; then
            sudo rm -R /home/$usuario/gameandwatch/game-and-watch-retro-go
        fi
        #sleep 5
        git clone --recurse-submodules https://github.com/kbeckmann/game-and-watch-retro-go
        cd game-and-watch-retro-go
        pip3 install -r requirements.txt
        cd /home/$usuario/gameandwatch
        if [ -d /home/$usuario/gameandwatch/game-and-watch-patch ]; then
            sudo rm -R /home/$usuario/gameandwatch/game-and-watch-patch
        fi
        #sleep 5
        git clone https://github.com/BrianPugh/game-and-watch-patch
        cd game-and-watch-patch
        pip3 install -r requirements.txt
        make download_sdk
        cd /home/$usuario/gameandwatch
        if [ -d /home/$usuario/gameandwatch/LCD-Game-Shrinker ]; then
            sudo rm -R /home/$usuario/gameandwatch/LCD-Game-Shrinker
        fi
        #sleep 5
        git clone https://github.com/bzhxx/LCD-Game-Shrinker
        sudo apt update
        sudo apt install snapd libopenjp2-7 libtiff5 libxslt-dev libatlas-base-dev
        sudo snap install core
        sudo snap install inkscape
        cd /home/$usuario/gameandwatch/LCD-Game-Shrinker
        pip3 install -r requirements.txt
    fi
fi

if [ "$confirm" != "S" ]; then
    echo " "
    echo "Cancelado..."
    sleep 3
    exit
fi
