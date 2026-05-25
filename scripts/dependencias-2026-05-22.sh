#!/bin/sh

cat << EOF
Os comandos a seguir instalarão as dependencias requeridas para a disciplina de
Banco de Dados nos laboratórios de ensino.

Ref: Issue #48 em https://github.com/rcarocha/laboratorio-ufcat/issues
EOF

read -p "Digite qualquer tecla quando estiver pronto. Requer indicacao da senha sudo"

mkdir -p /tmp/tarefas
cd /tmp/tarefas

wget https://raw.githubusercontent.com/rcarocha/laboratorio-ufcat-pub/refs/heads/main/figuras/papel-parede-oficial.webp

sudo cp papel-parede-oficial.webp /usr/share/lubuntu/wallpapers/papel-parede-oficial.webp
sudo chmod u-w /usr/share/lubuntu/wallpapers/papel-parede-oficial.webp

wget https://raw.githubusercontent.com/rcarocha/laboratorio-ufcat-pub/refs/heads/main/conf/dot.config/pcmanfm-qt/lxqt/settings.conf
cp ~/.config/pcmanfm-qt/lxqt/settings.conf ~/.config/pcmanfm-qt/lxqt/settings.conf.bak
cp settings.conf ~/.config/pcmanfm-qt/lxqt/
chmod 444 ~/.config/pcmanfm-qt/lxqt/settings.conf

sudo apt install -y cpu-checker
sudo apt install -y umbrello
sudo snap install dbeaver-ce --classic

