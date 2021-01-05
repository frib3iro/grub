#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : [grub-02.sh]
# Descrição : Script para correção do grub
# Versão    : 1.0
# Autor     : Fabio Junior Ribeiro
# Email     : rib3iro@live.com
# Data      : 11/12/2020
# Licença   : GNU/GPL v3.0
#----------------------------------------------------------------------
# Uso       : ./grub-01.sh
#----------------------------------------------------------------------
# Cores usadas no script
R='\033[0;31m'
G='\033[0;32m'
Y='\033[0;33m'
C='\033[0;36m'
# Fechamento das cores no script
F='\033[0m'
# Seta utilizada no inicio das frases
S='\e[32;1m>>>\e[m'
#----------------------------------------------------------------------
clear
echo -e "${S} ${C}Baixando o Grub ${F}"
sleep 2
pacman -S grub --noconfirm

echo
echo -e "${S} ${C}Reinstalando o grub${F}"
sleep 2
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

echo
echo -e "${S} ${C}Atualizando o arquivo grub.cfg${F}"
sleep 2
grub-mkconfig -o /boot/grub/grub.cfg

echo
echo -e "${S} ${C}Desmonte os pontos de montagem e reinicie o sistema${F}"
sleep 2
exit