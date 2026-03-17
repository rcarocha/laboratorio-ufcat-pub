#!/bin/bash

function all {
	prerequisitos
	linguagens
	editores
	geral
	ide
}

function prerequisitos {
	echo -- PREQUISITOS --
	sudo apt update
	sudo apt install -y lubuntu-desktop
	sudo apt install -y wget
	sudo apt install -y magic-wormhole
	sudo apt install -y gh
}

function linguagens {
	echo -- LINGUAGENS --
	c-cpp
	java
	python3
	javascript
}

function c-cpp {
	echo CPP
	sudo apt  install -y build-essential cmake
}

function java {
	echo JAVA
	sudo apt  install -y default-jdk
}

function python3 {
	echo PYTHON3
	sudo apt  install -y python3-pip python3-virtualenv
}

function javascript {
	echo JAVASCRIPT
	sudo apt  install -y nodejs
}


# Ambientes de Desenvolvimento

function ide {
	netbeans
	eclipse
	codeblocks
	visual-studio
	geany-ide
	portugol-studio
	# spyder
}

function netbeans {
	sudo snap install netbeans --classic
}

function eclipse {
	sudo snap install eclipse  --classic
}

function codeblocks {
	sudo apt  install -y codeblocks
}

function visual-studio {
	echo Instalando Visual Studio
	mkdir -p ~/Downloads/lab-dependencias
	cd ~/Downloads/lab-dependencias
	wget https://vscode.download.prss.microsoft.com/dbazure/download/stable/ce099c1ed25d9eb3076c11e4a280f3eb52b4fbeb/code_1.111.0-1772846623_amd64.deb
	echo 2b8b1a5b9c6fc14bd49920ce45c1b65798ab01dc3abab7aefd31102286e50ac4  code_1.111.0-1772846623_amd64.deb  > vscode-SHA256SUMS
	sha256sum -c vscode-SHA256SUMS
	sudo apt  install ./code_1.111.0-1772846623_amd64.deb
#   verificar erro em: https://askubuntu.com/questions/908800/what-does-this-apt-error-message-download-is-performed-unsandboxed-as-root
}


function portugol-studio {
	echo Instalando Portugol Studio
	# instalacao eh interativa e depende de usuario (deixar como ultimo passo)
	mkdir -p ~/Downloads/lab-dependencias
	cd ~/Downloads/lab-dependencias
	echo 49f4d1807e883076d8a0c918acf99a1541abf139f96ad3e83fe0278858a552e5  portugol-studio-2.7.5-linux-x64.run.zip > portugol-studio-SHA256SUMS
	wget https://github.com/UNIVALI-LITE/Portugol-Studio/releases/download/v2.7.5/portugol-studio-2.7.5-linux-x64.run.zip
	sha256sum -c portugol-studio-SHA256SUMS
	unzip portugol-studio-2.7.5-linux-x64.run.zip
	chmod u+x portugol-studio-2.7.5-linux-x64.run
	sudo ./portugol-studio-2.7.5-linux-x64.run
}

function geany-ide {
	sudo apt  install -y geany
}

function spyder {
	sudo apt  install -y spyder
}


# EDITORES DE TEXTO

function editores {
	gedit
	vim
	nano-pico
}

function vim {
	echo VIM ja instalado no sistema
}

function gedit {
	sudo apt  -y install gedit
	# alternativa: FeatherPad para lubuntu
}

function nano-pico {
	# ja instalado
	echo NANO/PICO ja instalado no sistema
}


# USO GERAL

function geral {
	github-cli
	chromium
	virtualbox
}

function github-cli {
	sudo apt  install -y gh
}

function chromium {
	sudo apt  install -y chromium-browser
}

function virtualbox {
	# sudo apt  install -y virtualbox
}


all




