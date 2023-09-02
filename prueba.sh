#echo привет
#export OPENOCD=/opt/openocd-git/bin/openocd
function ocd_exp {
export OPENOCD=/opt/openocd-git/bin/openocd
}
ocd_exp
export -f ocd_exp
sleep 1
echo пока
export -p | grep OPENOCD
