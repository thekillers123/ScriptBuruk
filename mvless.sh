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

echo -e ""
echo -e " ▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰▰" |lolcat
echo ""
echo -e " ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║                      VLESS                      ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e " ║" | lolcat
echo -e " ║  [ 1 ] > Create Vless Account"
echo -e " ║  [ 2 ] > Delete Vless Account"
echo -e " ║  [ 3 ] > Extending Vless Account Active Life"
echo -e " ║  [ 4 ] > Check User Login V2RAY"
echo -e " ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║ - CTRL C to cancel                              ║" | lolcat
echo -e " ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e ""
read -p "     Please select an option :  "  vless
echo -e ""
case $vless in
      1)
      clear
      add-vless
      exit
      ;;
      2)
      clear
      del-vless
      exit
      ;;
      3)
      clear
      renew-vless
      exit
      ;;
      4)
      clear
      cek-ws
      exit
      ;;
      0)
      clear
      menu
      exit
      ;;
      x)
      sudo -i
      exit
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 2
      clear
      mvless
      exit
      ;;
   esac
