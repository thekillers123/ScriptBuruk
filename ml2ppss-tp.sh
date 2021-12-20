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
echo -e " ╔════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║               PANEL L2TP/PPTP/SSTP              ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e " ║" | lolcat
echo -e " ║  [ 1 ]  Create L2TP Account"
echo -e " ║  [ 2 ]  Create PPTP Account"
echo -e " ║  [ 3 ]  Create SSTP Account"
echo -e " ║  [ 4 ]  Delete L2TP Account"
echo -e " ║  [ 5 ]  Delete PPTP Account"
echo -e " ║  [ 6 ]  Delete SSTP Account"
echo -e " ║  [ 7 ]  Renew L2TP Account"
echo -e " ║  [ 8 ]  Renew PPTP Account"
echo -e " ║  [ 9 ]  Renew SSTP Account"
echo -e " ║" | lolcat
echo -e " ╠════════━━━━━━━━━────── • ──────━━━━━━━━━════════╗" | lolcat
echo -e " ║  - CTRL C to cancel                             ║"  | lolcat
echo -e " ╚════════━━━━━━━━━────── • ──────━━━━━━━━━════════╝" | lolcat
echo -e ""
read -p "     Please Input Number  :  "  ml2ppsstp
echo -e ""
case $ml2ppsstp in
1)
add-l2tp
;;
2)
add-pptp
;;
3)
add-sstp
;;
4)
del-l2tp
;;
5)
del-pptp
;;
6)
del-sstp
;;
7)
renew-l2tp
;;
8)
renew-pptp
;;
9)
renew-sstp
;;
*)
echo "Please enter an correct number"
sleep 2
clear
ml2ppss-tp
exit
;;
esac
