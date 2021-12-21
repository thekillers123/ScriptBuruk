#!/bin/bash

clear
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
clear

yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
nc='\e[0m'
MYIP=$(wget -qO- ifconfig.co);
echo "Checking VPS"
clear
echo -e " "
echo -e " "
echo -e " "

echo -e " "
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipinfo.io/ip )
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
echo -e ""
echo -e  " $bl ║ \e[032;1mCPU Model:\e[0m$bd $cname  "
echo -e  " $bl ║ \e[032;1mNumber Of Cores:\e[0m$bd $cores"
echo -e  " $bl ║ \e[032;1mCPU Frequency:\e[0m$bd $freq MHz"
echo -e  " $bl ║ \e[032;1mTotal Amount Of RAM:\e[0m$bd $tram MB"
echo -e  " $op ║ \e[032;1mSystem Uptime:\e[0m$bd $up"
echo -e  " $op ║ \e[032;1mIsp Name:\e[0m$bd $ISP"
echo -e  " $op ║ \e[032;1mIp Vps:\e[0m$bd $IPVPS"
echo -e  " $op ║ \e[032;1mCity:\e[0m$bd $CITY"
echo -e  " $op ║ \e[032;1mTime:\e[0m$bd $WKT "
echo -e ""
echo -e ""
echo -e  "  ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰ " |lolcat
echo -e "                                                      SCRIPT PREMIUM" | lolcat
echo -e "                                                      - By harithwyd"
echo -e  "  ╔═════════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                          ┃ SCRIPT MENU ┃                        ║" | lolcat
echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
echo -e  " $bl ║"
echo -e  " $nc ║      [ 1 ] ►  >> >>  SSH & OpenVPN" | lolcat
echo -e  " $nc ║      [ 2 ] ►  >> >>  Panel Wireguard" | lolcat
echo -e  " $nc ║      [ 3 ] ►  >> >>  Panel L2TP, PPTP & SSTP" | lolcat
echo -e  " $nc ║      [ 4 ] ►  >> >>  Panel SSR & SS" | lolcat
echo -e  " $nc ║      [ 5 ] ►  >> >>  Panel VMESS" | lolcat
echo -e  " $nc ║      [ 6 ] ►  >> >>  Panel VLESS" | lolcat
echo -e  " $nc ║      [ 7 ] ►  >> >>  Panel Trojan" | lolcat
echo -e  " $bl ║ "
echo -e  "  ╠═════════════════════════════════════════════════════════════════╗" | lolcat
echo -e  "  ║                          ┃ SYSTEM MENU ┃                        ║" | lolcat
echo -e  "  ╠═════════════════════════════════════════════════════════════════╝" | lolcat
echo -e  "  ║"
echo -e  "  ║      [ 8 ] ► Add/Change Subdomain Host For VPS"
echo -e  "  ║      [ 9 ] ► Add ID Cloudflare"
echo -e  "  ║      [ 10 ] ► Cloudflare Add-Ons"
echo -e  "  ║      [ 11 ] ► Pointing BUG"
echo -e  "  ║      [ 12 ] ► Change Port Of Some Service"
echo -e  "  ║      [ 13 ] ► Autobackup Data VPS"
echo -e  "  ║      [ 14 ] ► Backup Data VPS"
echo -e  "  ║      [ 15 ] ► Restore Data VPS"
echo -e  "  ║      [ 16 ] ► Webmin Menu"
echo -e  "  ║      [ 17 ] ► Check Usage of VPS Ram"
echo -e  "  ║      [ 18 ] ► Reboot VPS"
echo -e  "  ║      [ 19 ] ► Speedtest VPS"
echo -e  "  ║      [ 20 ] ► Displaying System Information"
echo -e  "  ║      [ 21 ] ► Info Script"
echo -e  "  ║      [ 22 ] ► Update Script"
echo -e  "  ║23xray"
echo -e  "  ╠═════════════════════════════════════════════════════════════════╗\e[m" | lolcat
echo -e  "  ║ [0] Exit Menu                                                   ║\e[m" | lolcat
echo -e  "  ╚═════════════════════════════════════════════════════════════════╝\e[m" | lolcat
echo -e  ""
read -p  "     Please select an option :  " menu
echo -e   ""
 case $menu in
   1)
   mssh
   ;;
   2)
   mwg
   ;;
   3)
   ml2ppss-tp
   ;;
   4)
   mss-ssr
   ;;
   5)
   mvmess
   ;;
   6)
   mvless
   ;;
   7)
   mtrojan
   ;;
   8)
   add-host
   ;;
   9)
   cff
   ;;
   10)
   cfd
   ;;
   11)
   cfh
   ;;
   12)
   change
   ;;
   13)
   autobackup
   ;;
   14)
   backup
   ;;
   15)
   restore
   ;;
   16)
   wbmn
   ;;
   17)
   ram
   ;;
	 18)
   reboot
   ;;
	 19)
   speedtest
   ;;
	 20)
   info
   ;;
	 21)
   about
   ;;
	 22)
   update
   ;;
	 23)
   mxray
   ;;
   0)
   exit
   ;;
   *)
   echo -e "ERROR!! Please Enter an Correct Number"
   ;;
  esac
