#!/usr/bin/env bash

# variaveis
ciano='\033[0;36m'
verde='\033[0;32m'
vermelho='\033[0;31m'
amarelo='\033[0;32m'
fim='\033[0m'
seta='\e[32;1m-->\e[m'

clear
echo -e "${seta} ${ciano} Continuando a instalação ${fim}"
sleep 3s
clear

echo -e "${seta} ${ciano} Baixando o Grub ${fim}"
sleep 3s
pacman -S grub --noconfirm
clear

echo -e "${seta} ${ciano} Instalando o grub ${fim}"
sleep 3s
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
clear

echo -e "${seta} ${ciano} Configurando o grub ${fim}"
sleep 3s
grub-mkconfig -o /boot/grub/grub.cfg
clear

