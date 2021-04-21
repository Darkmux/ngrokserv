#!/bin/bash
#
# GNU/Linux - ©WHITE HACKS
# GPL - General Public License
# Open Source - Software Libre
#
# ┌═══════════┐  ┌════════════┐
# █ ngrokserv █=>█ 18/04/2021 █
# └═══════════┘  └════════════┘
#
# ===============================================
#                   VARIABLES
# ===============================================
PWD=$(pwd)
SYSTEM=$(uname -o)
# ===============================================
#               COLORES RESALTADOS
# ===============================================
negro="\e[1;30m"
azul="\e[1;34m"
verde="\e[1;32m"
cian="\e[1;36m"
rojo="\e[1;31m"
purpura="\e[1;35m"
amarillo="\e[1;33m"
blanco="\e[1;37m"
# ===============================================
#                 COLORES BAJOS
# ===============================================
black="\e[0;30m"
blue="\e[0;34m"
green="\e[0;32m"
cyan="\e[0;36m"
red="\e[0;31m"
purple="\e[0;35m"
yellow="\e[0;33m"
white="\e[0;37m"
# ===============================================
#              BANNER DE TEXTO NGROK
# ===============================================
NgrokServ(){
	sleep 0.5
	clear
echo -e "${negro}
███╗   ██╗ ██████╗ ██████╗  ██████╗ ██╗  ██╗
████╗  ██║██╔════╝ ██╔══██╗██╔═══██╗██║ ██╔╝
██╔██╗ ██║██║  ███╗██████╔╝██║   ██║█████╔╝
██║╚██╗██║██║   ██║██╔══██╗██║   ██║██╔═██╗
██║ ╚████║╚██████╔╝██║  ██║╚██████╔╝██║  ██╗
╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝"${blanco}
}
# ===============================================
#           INSTALANDO SERVIDOR NGROK
# ===============================================
Installation(){
	if [ "${SYSTEM}" == "Android" ]; then
		EXEC="/data/data/com.termux/files/usr/bin"
		FILE="ngrok"
	else
		EXEC="/bin"
		FILE="ngrok"
	fi
	if [ ! -x ${EXEC}/ngrok ]; then
		cp ${FILE} ${EXEC}
		chmod 777 ${EXEC}/ngrok
		cd ${EXEC}
echo -e -n "${negro}
┌═════════════════┐
█ ${verde}NGROK AUTHTOKEN ${negro}█
└═════════════════┘
┃
└═>>> "${blanco}
		read -r AUTHTOKEN
		sleep 0.5
		echo -e ""
		echo -e "${AUTHTOKEN}" >> token.txt
		NGROK=$(head -n1 token.txt | cut -d " " -f1)
		rm token.txt
		if [ "${NGROK}" == "./ngrok" ]; then
			${AUTHTOKEN}
		else
			./ngrok authtoken ${AUTHTOKEN}
		fi
echo -e "${negro}
┌══════════════════════════┐
█ ${verde}SERVIDOR NGROK INSTALADO ${negro}█
└══════════════════════════┘
┃    ┌═══════════════════┐
└═>>>█ ${blanco}ngrok http ${verde}<${blanco}port${verde}> ${negro}█
┃    └═══════════════════┘
┃    ┌═══════════════════┐
└═>>>█ ${blanco}ngrok tcp ${verde}<${blanco}port${verde}>  ${negro}█
     └═══════════════════┘
"${blanco}
	else
		rm ${EXEC}/ngrok
		Installation
	fi
}
NgrokServ
Installation
