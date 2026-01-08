#!/bin/sh

cat << EOF
Os comandos a seguir irão instalar dependências requeridas pelas disciplinas
nos Laboratórios de Ensino 1 e 2

Ref: Issue #11 em https://github.com/rcarocha/laboratorio-ufcat/issues/11

Serão instalados (caso inexistentes) os pacotes: 
   prolog, haskell, java-jdk, netbeans
   gh (CLI github), python3-pip python3-virtualenv spyder
   
IMPORTANTE: requer a indicação da senha do superusuário para execução do sudo

EOF
read -p "Digite qualquer tecla quando estiver pronto. "

sudo apt update
sudo apt -y install swi-prolog ghc default-jdk gh python3-pip python3-virtualenv spyder
sudo snap install netbeans --classic


