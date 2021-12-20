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
echo -e " ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" |lolcat
echo ""
echo -e " ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║                      VMESS                      ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e " ║" | lolcat
echo -e " ║  [ 1 ] > Create Vmess Websocket Account"
echo -e " ║  [ 2 ] > Delete Vmess Websocket Account"
echo -e " ║  [ 3 ] > Renew Vmess Account"
echo -e " ║  [ 4 ] > Check User Login Vmess"
echo -e " ║  [ 5 ] > Check User Login Vmess"
echo -e " ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║ - CTRL C to cancel                              ║" | lolcat
echo -e " ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e "\e[1;31m"
read -p "    Please select an option :  "  v2ray
echo -e "\e[0m"
case $v2ray in
    1)
    add-ws
    ;;
    2)
    del-ws
    ;;
    3)
    renew-ws
    ;;
    4)
    cek-ws
    ;;
    5)
    certv2ray
    ;;
		*)
    echo -e "Please enter an correct number"
    sleep 2
    clear
    mvmess
    exit
    ;;
esac
