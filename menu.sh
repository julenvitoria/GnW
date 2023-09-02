#INPUT=/tmp/$MENU.sh.$$
usuario="kde"
consola="zelda"
caratula="0"

clear
which dialog > dialog.txt
if grep "/dialog" ./dialog.txt ; then
        echo "Диалоговый пакет найден, он продолжается..."
        sleep 0.5
else
        echo "Не найден необходимый диалоговый пакет, устанавливаю..."
        echo " "
        sudo apt-add-repository universe -y
        sudo apt install -y dialog
        echo " "
        echo "Установлен!!"
        sleep 0.5
fi
clear
dialog --backtitle "G&W $consola - Утилиты прошивки ------------------ INFO: menu.sh Пользователь = $usuario   ////   Выбранная консоль = $consola ------------------" \
--title "Game&Watch - Menu ayuda para el flasheo" \
--ok-label Принять \
--cancel-label Выйти \
--menu "
Текущий пользователь: $usuario
Выбранная консоль: $consola

Выберите с помощью стрелок желаемый вариант:" 0 0 0 \
   1 "Смена пользователя. Важно: для правильной работы это необходимо выполнить в первый раз" \
   2 "Изменение модели консоли (aактуальная = $consola). Важно: Выберите правильную модель для правильной работы" \
   3 "Меню установки необходимые пакеты и программы и обновление STLINK" \
   4 "Сцена меню: резервное копирование/восстановление/освобождение, перепрошивка пользовательской подписи с помощью Retro-Go и резервное копирование/восстановление сохраненных состояний" \
   5 "Обновление данных скриптов " 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    ./instalacion/1.1-cambio-usuario.sh
    ./menu.sh
    clear;;
  2)clear
    ./instalacion/1.2-cambio-consola.sh
    ./menu.sh
    clear;;
  3)clear
    #source py/bin/activate
    ./1-menu-instalacion.sh
    ./menu.sh
    #deactivate
    clear;;
  4)clear
    # si no existe el directorio py se instala virtualenv, se crear el directorio, se crea un entorno virtual de python en dicho directorio y se instalan los modulos de python requeridos
    if [ ! -d py ]; then
        sudo apt update -y
        sudo apt install -y unzip binutils-arm-none-eabi python3 libhidapi-hidraw0 libftdi1 libftdi1-2 git python3-pip virtualenv
        echo ""
        echo ""
        echo -e "\e[1;34mSe crea directorio \"py\", se crea el entorno virtual de python, se activa y se instalan los Модули, необходимые для los diferentes repos.\e[0m"
        echo ""
        sleep 2
        mkdir py
        python3 -m virtualenv py
        source py/bin/activate
        echo ""
        echo -e "\e[1;34mМодули, необходимые для el patch -> ver requirements.txt del repo del patch\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/BrianPugh/game-and-watch-patch/main/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo ""
        echo -e "\e[1;34mМодули, необходимые для retrogo -> ver requirements.txt del repo de retrogo\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/sylverb/game-and-watch-retro-go/msx_wsv_genesis/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo ""
        echo -e "\e[1;34mМодули, необходимые для LCD-Shrinker -> ver requirements.txt del repo del LCD-Shrinker\e[0m"
        echo ""
        sleep 1
        wget https://raw.githubusercontent.com/bzhxx/LCD-Game-Shrinker/main/requirements.txt
        pip3 install -r requirements.txt
        rm requirements.txt
        echo -e "\e[1;34mТребования к устаревшим пакетам"
        pip3 install Pillow==9.5.0
	clear
    else
        source py/bin/activate
    fi
    ./2-menu-scene-$consola.sh
    deactivate
    ./menu.sh
    clear;;
  5)clear
    git reset --hard
    git pull --recurse-submodules
    sleep 1
    if [[ -n ["$usuario"] ]]; then
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.3-preparacion-sistema.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.4-openocd.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.5-menu-backup-restore-tools.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.6-menu-flashloader.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.7-menu-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.8-menu-patch.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.9-menu-LCD-Game-Shrinker.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./instalacion/1.10-instalacion-completa.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./2-menu-scene-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.R-actualizacion-retro-go.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./menu.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.1-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.2-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.3-save-state-zelda.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-save-state-mario.sh
        sed -i 's/^usuario=.*$/'usuario=\""$usuario"\"'/g' ./scene/2.2.4-save-state-zelda.sh
    fi
    #read -n 1 -s -r -p "Нажмите любую клавишу, чтобы продолжить"
    if [ $consola = mario ]; then
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./1-menu-instalacion.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./2-menu-scene-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./menu.sh
    fi
    if [ $consola = zelda ]; then
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./1-menu-instalacion.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./2-menu-scene-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.1-backup-restauracion.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./scene/2.2.H-opcion-herramientas.sh
        sed -i 's/^consola=.*$/'consola=\""mario"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^consola=.*$/'consola=\""zelda"\"'/g' ./menu.sh
    fi
    if [ $caratula = 0 ]; then
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.1-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.2-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.3-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.4-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^caratula=.*$/'caratula=\""0"\"'/g' ./menu.sh
    fi
    if [ $caratula = 1 ]; then
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2-retro-go-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-solo-retro-go-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.1-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-1mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-cfw-retro-go-4mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.2-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-cfw-retro-go-16mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.3-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-cfw-retro-go-64mb-zelda.sh
	    sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.4-save-state-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.5-cfw-retro-go-128mb-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-mario.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.6-cfw-retro-go-256mb-zelda.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./scene/2.2.C-opcion-caratula.sh
        sed -i 's/^caratula=.*$/'caratula=\""1"\"'/g' ./menu.sh
    fi
    read -n 1 -s -r -p "Нажмите любую клавишу, чтобы продолжить"
    ./menu.sh
    clear;;
esac
deactivate
clear
