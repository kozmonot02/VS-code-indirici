#!/bin/bash

####################################
#            Kozmonot02            #
####################################

#renk şeysi
    white="\033[1;37m"
    grey="\033[0;37m"
    purple="\033[0;35m"
    red="\033[1;31m"
    green="\033[1;32m"
    yellow="\033[1;33m"
    purple="\033[0;35m"
    fiuscha="\033[0;35m"
    blue="\033[1;34m"
    tp="\e[0m"
    
    
# ctrl+c ile çıkış
trap ctrl_c INT
ctrl_c() {
echo -e "\n"
echo -e "${blink}${yellow} kullandığınız için teşekkür ederim $tp"
exit 0
}


if [[ $USER = "root" ]] ; then
    echo "ok" &> /dev/null
else
    echo -e "$red sudo İle Deneyiniz."
    exit 1
fi
if [[ $1 =~ ^(-v|--version) ]] ; then
    echo "$version v1"   
fi
# yükleme şeysi
spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.1
    done
    echo -e "[${red}OK${tp}]"
}

#arayüz yüklemesi
spinlong

#arayüz
clear

echo -e "$yellow 1-)$white yükleme$yellow  2-)$white kaldırma"
echo ""
echo -e "\n"
echo -ne "${red}Vututu${white} ${green}Script]➢ "   
read oku

#yükleme

if [[ $oku = "1" ]] ; then
clear

sudo apt update
sudo apt install software-properties-common apt-transport-https wget

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt update
sudo apt install code

# vss zaten yuklu mu?
dpkg -l | grep code > /dev/null
if [ $? -eq 1 ]; then
    echo "Yukleme basliyor..."
   sudo apt install code -y
else
    echo " ✓ "
fi

fi

#kaldırma
if [[ $oku = "2" ]] ; then

clear
sudo apt remove code

fi