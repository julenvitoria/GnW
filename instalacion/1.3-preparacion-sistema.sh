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

sudo apt update
sudo apt upgrade -y
sudo apt install -y unzip binutils-arm-none-eabi python3 libhidapi-hidraw0 libftdi1 libftdi1-2 git python3-pip virtualenv software-properties-common
sudo apt-add-repository -y ppa:inkscape.dev/stable
sudo apt update

# instalar virtualenv, crear el directorio "py" y si existe borrarlo y volverlo a crear, crear un entorno virtual de python en dicho directorio e instalar los modulos de python requeridos
echo ""
echo ""
echo -e "\e[1;34mSe crea directorio \"py\", se crea el entorno virtual de python, se activa y se instalan los modulos requeridos para los diferentes repos.\e[0m"
echo ""
sleep 2
if [ -d py ]; then
    rm -R py
fi
mkdir py
python3 -m virtualenv py
source py/bin/activate
echo ""
echo -e "\e[1;34mModulos requeridos para el patch -> ver requirements.txt del repo del patch\e[0m"
echo ""
sleep 1
wget https://raw.githubusercontent.com/BrianPugh/game-and-watch-patch/main/requirements.txt
pip3 install -r requirements.txt
rm requirements.txt
echo ""
echo -e "\e[1;34mModulos requeridos para retrogo -> ver requirements.txt del repo de retrogo\e[0m"
echo ""
sleep 1
wget https://raw.githubusercontent.com/sylverb/game-and-watch-retro-go/msx_wsv_genesis/requirements.txt
pip3 install -r requirements.txt
rm requirements.txt
echo ""
echo -e "\e[1;34mModulos requeridos para LCD-Shrinker -> ver requirements.txt del repo del LCD-Shrinker\e[0m"
echo ""
sleep 1
wget https://raw.githubusercontent.com/bzhxx/LCD-Game-Shrinker/main/requirements.txt
pip3 install -r requirements.txt
rm requirements.txt

echo -e "\e[1;34mRequerimientos por paquetes deprecados"
echo -e "\e[1;34m \e[0m"
pip3 install Pillow==9.5.0
clear
#cd /home/$usuario
#if [ -d /home/$usuario/gameandwatch ]; then
#sudo rm -R /home/$usuario/gameandwatch
#        mkdir /home/$usuario/gameandwatch
#else
#        mkdir /home/$usuario/gameandwatch
#fi
#wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/10-2020q4/gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
#tar xvf gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
#rm gcc-arm-none-eabi-10-2020-q4-major-x86_64-linux.tar.bz2
#export GCC_PATH=/home/$usuario/opt/gcc-arm-none-eabi-10-2020-q4-major/bin/
#echo export GCC_PATH=/home/$usuario/opt/gcc-arm-none-eabi-10-2020-q4-major/bin/ >>~/.bashrc

echo -e "\e[1;34m \e[0m"
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
        echo "Ya existe el directorio gameandwatch/gcc-arm-none-eabi-10-2020-q4-major"
        sleep 2
    else
        echo "Creando directorio gameandwatch/gcc-arm-none-eabi-10-2020-q4-major"
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
    fi
fi

if [ "$confirm" != "S" ]; then
    echo " "
    echo "Cancelado..."
    sleep 3
    exit
fi
