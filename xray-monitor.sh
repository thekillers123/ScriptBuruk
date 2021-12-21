#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
clear

data=($(cat /etc/xray/xray-clients.txt | awk '{print $1}'))
data2=($(netstat -anp | grep ESTABLISHED | grep tcp6 | grep xray | grep -w 443 | awk '{print $5}' | cut -d: -f1 | sort | uniq))
domain=$(cat /usr/local/etc/xray/domain)
touch /tmp/{ipvless.txt,ipvless-other.txt}
clear
echo -e ""
echo -e "========================="
echo -e "  Xray Login Monitor"
echo -e "-------------------------"
for user in "${data[@]}"
do
  for ip in "${data2[@]}"
  do
    total=$(cat /var/log/xray/access.log | grep -w ${user}@${domain} | awk '{print $3}' | cut -d: -f1 | grep -w $ip | sort | uniq)
    if [[ "$total" = "$ip" ]]; then
      echo -e "$total" >> /tmp/ipvless.txt
    else
      echo -e "$ip" >> /tmp/ipvless-other.txt
    fi
    total2=$(cat /tmp/ipvless.txt)
    sed "/${total2}/d" /tmp/ipvless-other.txt
  done
  total=$(cat /tmp/ipvless.txt)
  if [[ -n "$total" ]]; then
    total2=$(cat /tmp/ipvless.txt | nl)
    echo -e "$user :"
    echo -e "$total2"
  fi
done
other=$(cat /tmp/ipvless-other.txt | sort | uniq | nl)
if [[ -n "$other" ]]; then
  echo -e "other :"
  echo -e "$other"
fi
echo -e "========================="
echo -e ""
rm -f /tmp/{ipvless.txt,ipvless-other.txt}
