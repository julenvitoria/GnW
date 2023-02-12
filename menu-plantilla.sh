#!/bin/bash
#By julenvitoria

INPUT=/tmp/$MENU.sh.$$

dialog --backtitle "G&W - Utilidades de flasheo" \
--title "G&W menu de flasheo" \
--ok-label Apply \
--cancel-label Exit \
--menu "Selecciona con las flechas la opcion deseada:" 12 120 15 \
   1 "" \
   2 "" \
   3 "" \
   4 "" 2>"${INPUT}"
menuitem=$(<"${INPUT}")
case $menuitem in
  1)clear
    
    clear;;
  2)clear
    
    clear;;
  3)clear
    
    clear;;
  4)clear
    
    clear;;
esac
clear
