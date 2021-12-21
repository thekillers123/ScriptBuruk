#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"

clear
echo -e ""
echo -e "==============================="
echo -e "Username          Exp. Date"
echo -e "-------------------------------"
while read expired
do
  user=$(echo $expired | awk '{print $1}')
  exp=$(echo $expired | awk '{print $3}')
  exp_date=$(date -d"${exp}" "+%d %b %Y")
  printf "%-17s %2s\n" "$user" "$exp_date"
done < /etc/xray/xray-clients.txt
total=$(wc -l /etc/xray/xray-clients.txt | awk '{print $1}')
echo -e "-------------------------------"
echo -e "Total accounts: $total"
echo -e "==============================="
echo -e ""
