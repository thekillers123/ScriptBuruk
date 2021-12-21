#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear
source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/v2ray/domain)
else
domain=$IP
fi

	clear
	echo -e "Add Xray User"
	echo -e "-------------"
	read -p "Username : " user
	if grep -qw "$user" /etc/xray/xray-clients.txt; then
		echo -e ""
		echo -e "User '$user' already exist."
		echo -e ""
		exit 0
	fi
	read -p "Expired (days): " masaaktif

	uuid=$(cat /proc/sys/kernel/random/uuid)
	exp=$(date -d +${duration}days +%Y-%m-%d)
	expired=$(date -d "${exp}" +"%d %b %Y")
	domain=$(cat /etc/v2ray/domain)
	email=${user}@${domain}
	echo -e "${user}\t${uuid}\t${exp}" >> /etc/xray/xray-clients.txt

	cat /usr/local/etc/xray/config.json | jq '.inbounds[0].settings.clients += [{"id": "'${uuid}'","flow": "xtls-rprx-direct","email": "'${email}'"}]' > /usr/local/etc/xray/config_tmp.json
	mv -f /usr/local/etc/xray/config_tmp.json /usr/local/etc/xray/config.json
	cat /usr/local/etc/xray/config.json | jq '.inbounds[1].settings.clients += [{"id": "'${uuid}'","email": "'${email}'"}]' > /usr/local/etc/xray/config_tmp.json
	mv -f /usr/local/etc/xray/config_tmp.json /usr/local/etc/xray/config.json
	service xray restart
	clear
	uuid=$(cat /etc/xray/xray-clients.txt | grep -w "$user" | awk '{print $2}')
	domain=$(cat /etc/v2ray/domain)
	exp=$(cat /etc/xray/xray-clients.txt | grep -w "$user" | awk '{print $3}')

	clear
	echo -e "Expired : $exp_date"
	echo -e ""
	echo -e "VLESS + WebSocket + TLS"
	echo -e "-----------------------"
	echo -e "Host : $domain"
	echo -e "Server Port : 443"
	echo -e "User ID : $uuid"
	echo -e "Security : none"
	echo -e "Network Type : ws"
	echo -e "WebSocket Path : /xray"
	echo -e "TLS : tls"
	echo -e ""
	echo -e "Link : vless://$uuid@$domain:443?type=ws&security=tls&path=%2fxray#WS_TLS-$domain"
	echo -e ""
	echo -e "VLESS + TLS / XTLS"
	echo -e "------------------"
	echo -e "Adress: $domain"
	echo -e "Port: 443"
	echo -e "ID: $uuid"
	echo -e "Flow: xtls-rprx-direct"
	echo -e "Encryption: none"
	echo -e "Network: tcp"
	echo -e "Head Type: none"
	echo -e "TLS: tls / xtls"
	echo -e ""
	echo -e "Link : vless://$uuid@$domain:443?security=xtls&flow=xtls-rprx-direct#XTLS-$domain"
	echo -e ""
