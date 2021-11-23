#!/bin/bash
#By julenvitoria

clear
which java > java.txt
if grep "/java" ./java.txt ; then
        echo "Encontrado paquete java, se prosigue..."
        sleep 1
else
        echo "No encontrado paquete java necesario, instalando..."
        echo " "
        sudo apt install -y default-jdk default-jre
        echo " "
        echo "Instalado!!"
        sleep 1
fi
cd instalacion/actualizador
sudo java -jar STLinkUpgrade.jar