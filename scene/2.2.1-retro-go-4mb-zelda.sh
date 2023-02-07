#!/bin/bash
#By julenvitoria

usuario="kde"
consola="zelda"
proc="2"

clear
dialog --backtitle "G&W $consola - Utilidades de flasheo ------------------ INFO: 2.2.1-retro-go-4mb-zelda.sh Usuario = $usuario ------------------" \
--title "Instalar solo Retro-Go en consola 4MB" \
--yesno "Se recomienda realizar el proceso con la batería cargada al 100% para evitar problemas. Se flasheara solamente el emulador Retro-Go por lo que no tendremos el menu original. Las roms que existan en /home/$usuario/game-and-watch-retro-go/roms/ tambien se subiran a la consola." 0 0
ans=$?
if [ $ans -eq 0 ]; then
    clear
	cd /home/$usuario/gameandwatch/game-and-watch-retro-go
    make clean
    make -j$proc COMPRESS=lzma GNW_TARGET=zelda
    echo " "
    echo " "
    echo " "
    echo -e "\e[1;34mSi ya has ejecutado esta opcion anteriormente y algo ha salido mal desmonta la consola y vuelve a ejecutar esta\e[0m"
    echo -e "\e[1;34mopcion y, al llegar a este punto, desconecta la bateria y vuelve a conectarla antes de realizar lo siguiente.\e[0m"
    echo " "
    echo " "
    echo -e "\e[0;32mSi durante el siguiente proceso nos dice que ha fallado el flasheo, que no puede conectar y nos pregunta si\e[0m"
    echo -e "\e[0;32mvamos a hacer un power cycle (quitar bateria, reconectar y encender) pulsaremos el boton de encendido y lo \e[0m"
    echo -e "\e[0;32mmantendremos pulsado unos segundos, le diremos que si con \"y\" (yes), entonces el proceso continuara.\e[0m"
    echo -e "\e[1;31mPulsa y manten pulsado el boton de encendido y justo despues pulsa cualquier tecla para continuar...\nATENCION: No sueltes el boton al menos hasta que empiece a borrar la memoria externa (cuando pone \"Erasing xxxx bytes...\" en la pantalla\e[0m"
    echo " "
    read -n 1 -s -r -p "Pulsa cualquier tecla para continuar cuando lo tengas listo..."
	make -j$proc COMPRESS=lzma GNW_TARGET=$consola flash
    echo " "
    echo " "
    echo " "
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
