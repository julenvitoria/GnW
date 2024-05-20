#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="mario"
proc="4"
caratula="1"

dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola menu Retro-Go + custom firmware" \
--msgbox "El flasheo se puede realizar para diferentes memorias, elige la mas conveniente a tu hardware. NOTA: Se recomienda realizar el proceso con la batería cargada al 100% para evitar sustos." 0 0
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario   ////   Consola seleccionada = $consola ------------------" \
--title "G&W $consola CFW + Retro-Go /// INFO: Usuario=$usuario --- Consola seleccionada=$consola --- Roms en /home/$usuario/game-and-watch-retro-go/roms/" \
--ok-label Apply \
--cancel-label Exit \
--menu "
Usuario actual: $usuario
Consola seleccionada: $consola
Opcion caratulas: $caratula (0=NO y 1=SI)
Roms: /home/$usuario/game-and-watch-retro-go/roms/

Selecciona con las flechas la opcion deseada:" 0 0 0 \
   H "Herramientas y utilidades" \
   1 "1MB: Compilar solo Retro-Go sin CFW para consola $consola original sin CFW" \
   2 "1MB: Flashear solo Retro-Go sin CFW en consola $consola original sin CFW" \
   3 "16MB: Compilar solo Retro-Go sin CFW para consola $consola sin CFW" \
   4 "16MB: Flashear solo Retro-Go sin CFW en consola $consola sin CFW" \
   5 "64MB: Compilar solo Retro-Go sin CFW para consola $consola sin CFW" \
   6 "64MB: Flashear solo Retro-Go sin CFW en consola $consola sin CFW" \
   7 "128MB: Compilar solo Retro-Go sin CFW para consola $consola sin CFW" \
   8 "128MB: Flashear solo Retro-Go sin CFW en consola $consola sin CFW" \
   9 "256MB: Compilar solo Retro-Go sin CFW para consola $consola sin CFW" \
   10 "256MB: Flashear solo Retro-Go sin CFW en consola $consola sin CFW" \
   11 "Descarga y restauracion de saves-states con parametros \"solo retro-go\""   2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  H)clear
    ./scene/2.2.H-opcion-herramientas.sh
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  1)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  2)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario ------------------" \
    --title "Instalar solo Retro-Go en consola G&W $consola 1MB sin CFW" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  3)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=16 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  4)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario ------------------" \
    --title "Instalar solo Retro-Go en consola G&W $consola 16MB sin CFW" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=16 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  5)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=64 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  6)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario ------------------" \
    --title "Instalar solo Retro-Go en consola G&W $consola 64MB sin CFW" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=64 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  7)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=128 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  8)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario ------------------" \
    --title "Instalar solo Retro-Go en consola G&W $consola 128MB sin CFW" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=128 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  9)clear
    cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=256 COVERFLOW=$caratula GNW_TARGET=$consola
    read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  10)clear
    dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-solo-retro-go-mario.sh Usuario = $usuario ------------------" \
    --title "Instalar solo Retro-Go en consola G&W $consola 256MB sin CFW" \
    --yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
    ans=$?
    if [ $ans -eq 0 ]; then
        clear
        echo " "
        echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
        echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
        echo " "
        echo " "
        echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
        echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
        echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
        echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
        read -n 1 -s -r -p ""
        cd /home/$usuario/gameandwatch/game-and-watch-retro-go
        make -j$proc COMPRESS=lzma EXTFLASH_SIZE_MB=256 COVERFLOW=$caratula GNW_TARGET=$consola flash
        read -n 1 -s -r -p "Presiona cualquier tecla para continuar"
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso realizado." 0 0
    else
        dialog --backtitle "G&W - Utilidades de flasheo" \
        --title "Instalar solo Retro-Go" \
        --msgbox "Proceso cancelado." 0 0
    fi
    cd -
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
  11)clear
    ./scene/2.2.1-save-state-$consola.sh
    ./scene/2.2.1-solo-retro-go-$consola.sh
    clear;;
esac
clear
