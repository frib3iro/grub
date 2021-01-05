#!/usr/bin/env bash
#----------------------------------------------------------------------
# Script    : [grub-01.sh]
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
# S utilizada no inicio das frases
S='\e[32;1m>>>\e[m'
#----------------------------------------------------------------------
clear
echo -e "${S} ${C}Iniciando recuperação do grub${F}"
sleep 2

echo
echo -e "${S} ${C}Listando as partoções${F}"
sleep 2

echo
echo -e "${S} ${C}Indentificando a partição do linux ${F}"
sleep 2
lsblk /dev/sdb

echo
echo -en "${S} ${C}Digite o nome da partição que o linux se encontra: ${F}"
read particao
clear

echo
echo -e "${S} ${C}Montando a partição do linux em /mnt${F}"
sleep 2
mount ${particao} /mnt

echo
echo -e "${S} ${C}Copiando a parte 2 para /mnt${F}"
sleep 2
cp grub-02.sh /mnt

echo
echo -e "${S} ${C}Entrando no chroot${F}"
sleep 2
arch-chroot /mnt ./grub-02.sh
