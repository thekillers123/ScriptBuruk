#!/bin/bash
clear
# Install Xray
apt-get install -y lsb-release gnupg2 wget lsof tar unzip curl libpcre3 libpcre3-dev zlib1g-dev openssl libssl-dev jq nginx uuid-runtime
curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh | bash -s -- install
echo $domain > /usr/local/etc/xray/domain
wget -qO /usr/local/etc/xray/config.json "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/xray_tls_ws_mix-rprx-direct.json"
sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/${domain}.conf
sed -i "s/x.x.x.x/${ip}/g" /etc/nginx/conf.d/${domain}.conf
mkdir /etc/xray
curl -L get.acme.sh | bash
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
sed -i "6s/^/#/" /etc/nginx/conf.d/${domain}.conf
sed -i "6a\\\troot /var/www/html/;" /etc/nginx/conf.d/${domain}.conf
systemctl restart nginx
/root/.acme.sh/acme.sh --issue -d "${domain}" --webroot "/var/www/html/" -k ec-256 --force
/root/.acme.sh/acme.sh --installcert -d "${domain}" --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --reloadcmd "systemctl restart xray" --ecc --force
sed -i "7d" /etc/nginx/conf.d/${domain}.conf
sed -i "6s/#//" /etc/nginx/conf.d/${domain}.conf
chown -R nobody.nogroup /etc/xray/xray.crt
chown -R nobody.nogroup /etc/xray/xray.key
touch /etc/xray/xray-clients.txt
sed -i "s/\tinclude \/etc\/nginx\/sites-enabled\/\*;/\t# include \/etc\/nginx\/sites-enabled\/\*;asd/g" /etc/nginx/nginx.conf
mkdir /etc/systemd/system/nginx.service.d
printf "[Service]\nExecStartPost=/bin/sleep 0.1\n" | tee /etc/systemd/system/nginx.service.d/override.conf
systemctl daemon-reload
systemctl restart xray

cd /usr/bin
wget -O mxray "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/mxray.sh"
wget -O add-xray "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/add-xray.sh"
wget -O del-xray "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/del-xray.sh"
wget -O renew-xray "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/renew-xray.sh"
wget -O cek-xray "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/cek-xray.sh"
wget -O xray-monitor "https://raw.githubusercontent.com/XC0D3-X/ScriptBuruk/main/xray-monitor.sh"

chmod +x mxray
chmod +x add-xray
chmod +x del-xray
chmod +x renew-xray
chmod +x cek-xray
chmod +x xray-monitor
rm -f /root/xray.sh
