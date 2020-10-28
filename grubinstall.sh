#!/usr/bin/env bash

# variaveis
ciano='\033[0;36m'
verde='\033[0;32m'
vermelho='\033[0;31m'
amarelo='\033[0;32m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano} Indentificando a partição do linux ${fim}"
sleep 3s
lsblk
echo -en "${seta} ${ciano} Digite o nome da partição que o linux se encontra: ${fim}"
read particao
clear

echo -e "${seta} ${ciano} Montando a partição do linux em /mnt ${fim}"
sleep 3s
mount ${particao} /mnt
clear

echo -e "${seta} ${ciano} Copiando o script grubinstall.sh pra dentro de /mnt ${fim}"
sleep 3s
cp grubcontinue.sh /mnt
clear

echo -e "${seta} ${ciano} Dando arch-chroot para dentro de /mnt e executando o script grubinstall.sh ${fim}"
sleep 3s
arch-chroot /mnt ./grubcontinue.sh
clear

