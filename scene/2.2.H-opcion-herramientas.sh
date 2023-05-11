#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"

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
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
  3)clear
    dialog --backtitle "G&W $consola - Herramientas y Utilidades ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
       --msgbox "¡¡¡ATENCION!!! El programa de test de la flash externa se carga en la memoria interna para poder realizarse. Esto quiere decir que si tenemos dual boot con CFW+Retro-Go ademas de retrogo también habrá que reflashear el CFW porque éste será reemplazado por el programa de test de la flash. Si tenemos consola con solo Retro-Go tendremos que reflashear Retro-Go completo." 0 0
    dialog --backtitle "G&W $consola - Herramientas y Utilidades ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
           --title "Herramientas y utilidades G&W" \
           --yesno "¡¡¡IMPORTANTE!!! Para realizar el proceso de test de la flash es necesario haber compilado Retro-Go para tu tipo de memoria con al menos una rom de manera satisfactoria. Si no lo realizaste vuelve atras y compila Retro-Go con al menos una rom. Si no lo compilaste y prosigues dara error y la consola se quedara con la pantalla en negro. Si ya lo hiciste prosigue con el proceso. ¿Deseas continuar?" 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo -e "\e[1;31mConecta la consola con el stlink y pulsa cualquier tecla para realizar el test...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make GNW_TARGET=$consola flash_test
        cd -
        echo -e "\e[1;31mProceso terminado. Pulsa cualquier tecla para continuar...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
               --title "INFO: Usuario=$usuario --- Menu herramientas y utilidades" \
               --msgbox "A continuacion se realizará un make reset porque en la mayoria de los casos ayuda a poder apagar la consola despues de haber realizado el test." 0 0
        clear
        echo -e "\e[1;31mConecta la consola con el stlink y pulsa cualquier tecla para realizar el reset...\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go/
        make reset
        cd -
        echo -e "\e[1;31mProceso terminado. Pulsa cualquier tecla para continuar...\e[0m"
        read -n 1 -s -r -p ""
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
               --title "INFO: Usuario=$usuario --- Menu herramientas y utilidades" \
               --msgbox "¡¡¡ATENCION!!! Proceso realizado, pero RECUERDA: El programa de test de la flash externa se carga en la memoria interna para poder realizarse. Esto quiere decir que si tenemos dual boot con CFW+Retro-Go habra que habrá que reflashear el CFW porque éste será reemplazado por el programa de test de la flash. Si tenemos consola con solo Retro-Go tendremos que reflashear Retro-Go completo." 0 0
    else
        dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.H-opcion-herramientas.sh Usuario = $usuario ------------------" \
               --title "INFO: Usuario=$usuario --- Menu herramientas y utilidades" \
               --msgbox "Proceso cancelado." 0 0
    fi
    ./scene/2.2.H-opcion-herramientas.sh
    clear;;
esac
clear
