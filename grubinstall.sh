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
fdisk -l
echo -en "${seta} ${ciano} Digite o nome da partição que o linux se encontra: ${fim}"
read particao
clear

echo -e "${seta} ${ciano} Montando a partição do linux em /mnt ${fim}"
sleep 3s
mount ${particao} /mnt
clear

echo -e "${seta} ${ciano} Copiando o script grubinstall.sh pra dentro de /mnt ${fim}"
sleep 3s
cp grubinstall.sh /mnt
clear

echo -e "${seta} ${ciano} Dando arch-chroot para dentro de /mnt e executando o script grubinstall.sh ${fim}"
sleep 3s
arch-chroot /mnt ./grubinstall.sh
clear

echo -e "${seta} ${ciano} Baixando o Gerenciador de boot e mais alguns pacotes ${fim}"
sleep 3s
pacman -S grub --noconfirm
clear

echo -e "${seta} ${ciano}Instalando o grub${fim}"
sleep 3s
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
clear

echo -e "${seta} ${ciano}Configurando o grub${fim}"
sleep 3s
grub-mkconfig -o /boot/grub/grub.cfg
clear

