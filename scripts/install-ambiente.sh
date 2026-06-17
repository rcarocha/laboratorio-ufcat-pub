#!/bin/sh

cat << EOF
Este script configurará o ambiente do lubuntu para o ambiente padrão definido para o laboratório.
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

# .xscreensaver
wget https://raw.githubusercontent.com/rcarocha/laboratorio-ufcat-pub/refs/heads/main/conf/dot.xscreensaver
cp dot.xscreensaver ~/.xscreensaver
chmod 444 ~/.xscreensaver

# ~/.config/lxqt/lxqt-powermanagement.conf
wget https://raw.githubusercontent.com/rcarocha/laboratorio-ufcat-pub/refs/heads/main/conf/dot.config/lxqt/lxqt-powermanagement.conf
cp ~/.config/lxqt/lxqt-powermanagement.conf ~/.config/lxqt/lxqt-powermanagement.conf.bak
cp lxqt-powermanagement.conf ~/.config/lxqt/lxqt-powermanagement.conf
chmod 444 ~/.config/lxqt/lxqt-powermanagement.conf

# ~/.config/lxqt/power.conf
wget https://raw.githubusercontent.com/rcarocha/laboratorio-ufcat-pub/refs/heads/main/conf/dot.config/lxqt/power.conf
cp ~/.config/lxqt/power.conf ~/.config/lxqt/power.conf.bak
cp power.conf ~/.config/lxqt/power.conf
chmod 444 ~/.config/lxqt/power.conf

