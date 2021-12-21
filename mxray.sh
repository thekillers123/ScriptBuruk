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
echo -e ""
echo -e  "  ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e  "  ║                    XRAY/VLESS                   ║" | lolcat
echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e  "  ║" | lolcat
echo -e  "  ║  [ 1 ] > Create XRAY Account"
echo -e  "  ║  [ 2 ] > Delete XRAY Account"
echo -e  "  ║  [ 3 ] > Extend XRAY Account Active Life"
echo -e  "  ║  [ 4 ] > Check User Login XRAY"
echo -e  "  ║" | lolcat
echo -e  "  ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e  "  ║ - CTRL C to cancel                              ║" | lolcat
echo -e  "  ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e "\e[1;32m"
read -p "     Please select an option :  "  XRAY
echo -e "\e[0m"
case $XRAY in
      1)
      add-xray
      ;;
      2)
      del-xray
      ;;
      3)
      renew-xray
      ;;
      4)
      cek-xray
      ;;
      *)
      echo -e "Please enter an correct number"
      sleep 2
      clear
      mxray
      exit
      ;;
  esac
