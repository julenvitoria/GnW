#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"

clear
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
       --title "INFO: Usuario=$usuario --- Menu herramientas y utilidades" \
       --infobox "G&W herramientas y utilidades" 0 0 ; sleep 1
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
       --title "INFO: Usuario=$usuario --- Menu herramientas y utilidades" \
       --ok-label Apply \
       --cancel-label Exit \
       --menu "Selecciona con las flechas la opcion deseada:" 12 140 15 \
          1 "Abrir el actualizador del firm del stlink" \
          2 "Realizar un make reset (realizar solo si la consola se queda en negro y no llega al menu)" \
          3 "Realizar un flash test (para verificar la conexion con el chip de memoria)"   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
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
    cd -
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
  2)clear
    echo -e "\e[1;31mConecta la consola con el stlink y pulsa cualquier tecla para realizar el reset...\e[0m"
    read -n 1 -s -r -p ""
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
    make reset
    cd -
    echo -e "\e[1;31mProceso terminado. Pulsa cualquier tecla para continuar...\e[0m"
    read -n 1 -s -r -p ""
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
           --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --msgbox "Proceso realizado. Save states descargados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
  3)clear
    echo -e "\e[1;31mConecta la consola con el stlink y pulsa cualquier tecla para realizar el test...\e[0m"
    read -n 1 -s -r -p ""
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
    make flash_test
    cd -
    echo -e "\e[1;31mProceso terminado. Pulsa cualquier tecla para continuar...\e[0m"
    read -n 1 -s -r -p ""
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
           --title "INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Save states en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" \
           --msgbox "Proceso realizado. Save states descargados en:/home/$usuario/gameandwatch/game-and-watch-retro-go/save_states/" 0 0
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
esac
clear
