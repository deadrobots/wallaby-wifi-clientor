#!/bin/bash 

SSID=""
PASSWORD=""

CURDATE=$(date +%s)

echo "Updating Wallaby to connect to a wireless network..."
echo "(NOTE: Will no longer function as a Wireless Access Point (WAP), but will continue to connect over USB)."
sleep 4


if [ -z "${SSID}" ]; then
        echo "SSID not set in the script. Since it's not set, I'll ask you for some information."
        echo "Please modify the options at the top of this script with another computer if you have no way to provide input."
        echo ""
        read -p "Enter SSID and press [ENTER]:" SSID
        echo ""
        read -p "Enter Password and press [ENTER]:" PASSWORD
        echo ""
fi

BKUPDIR=/home/root/wallaby-pre-wifi-mods-backup

mkdir BKUPDIR
if [ -d "$BKUPDIR" ]; then
	TARBAK="${BACKUPDIR}-${CURDATE}.tar"
	echo "Backup dir already exists. Tarring old backup as ${TARBAK}"
	tar -cf "${TARBAK}" "${BKUPDIR}"
fi
echo "Backup directory set to: $BKUPDIR" 

echo "backing up /etc/network/interfaces"
cp "/etc/network/interfaces" "$BKUPDIR"

cat > /etc/network/interfaces << EOL
allow-hotplug wlan0
iface wlan0 inet dhcp
wpa-roam /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
iface default inet dhcp
EOL

echo "backing up /etc/wpa_supplicant/wpa_supplicant-wlan0.conf -> /etc/wpa_supplicant/wpa_supplicant-wlan0.conf-${CURDATE}.bak"
cp "/etc/wpa_supplicant/wpa_supplicant-wlan0.conf" "$BKUPDIR"

cat > /etc/wpa_supplicant/wpa_supplicant-wlan0.conf << EOL
ctrl_interface=/var/run/wpa_supplicant
ctrl_interface_group=0
update_config=1
# Connect to a WPA2 protected network
network={
      ssid="${SSID}"
      proto=WPA2
      key_mgmt=WPA-PSK
      pairwise=CCMP TKIP
      group=CCMP TKIP
      scan_ssid=1
      psk="${PASSWORD}"
      priority=10
}
EOL

echo "moving /etc/udhcpd.conf to backup directory"
mv /etc/udhcpd.conf "$BKUPDIR"

echo "moving /usr/bin/wifi_configurator.py to backup directory"
mv /usr/bin/wifi_configurator.py "$BKUPDIR"

echo "moving /etc/systemd/network/wifi.network to backup directory"
mv /etc/systemd/network/wifi.network "$BKUPDIR"

cat > /etc/systemd/network/wifi.network << EOL
[Match]
Name=wlan0

[Network]
DHCP=v4

#[Address]
#Address=192.168.1.76
EOL


# default is: /usr/sbin/wpa_supplicant -c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf -iwlan0
############ INIT SCRIPT ##########
cat > /etc/init.d/startClientWifi.sh << EOL
touch /home/root/thisRan
ifconfig wlan0 down
sleep 2
wpa_supplicant -B -Dnl80211 -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
sleep 5
ifconfig wlan0 up
ifconfig -a wlan0 | grep 'inet addr:' | wall -n
EOL
###################################
chmod +x /etc/init.d/startClientWifi.sh


echo "moving /etc/systemd/network/ap.network to backup directory"
mv /etc/systemd/network/ap.network "$BKUPDIR"

cat > /etc/systemd/system/wificlient.service << EOL
[Unit]
Description=Controls client wifi connection using wpa_supplicant
After=multi-user.target

[Service]
RemainAfterExit=yes
ExecStart=/bin/sh -c "/etc/init.d/startClientWifi.sh"
ExecStop=/bin/sh -c "pkill wpa_supplicant"
RemainAfterExit=yes

[Install]
WantedBy=graphical.target

EOL
systemctl enable wificlient.service

# defaults for wificlient: 
#   wificlient.service - Controls client wifi connection using wpa_supplicant
#   Loaded: loaded (/etc/systemd/system/wificlient.service; enabled; vendor preset: enabled)
#   Active: active (exited) since Tue 2018-02-06 00:18:27 UTC; 54min ago
#   Process: 1798 ExecStart=/bin/sh -c /etc/init.d/startClientWifi.sh (code=exited, status=0/SUCCESS)
#   Main PID: 1798 (code=exited, status=0/SUCCESS)
#   CGroup: /system.slice/wificlient.service


systemctl disable wifi.service
systemctl disable wifi

# defaults for wifi:
# wifi.service - wifi
#   Loaded: loaded (/lib/systemd/system/wifi.service; disabled; vendor preset: enabled)
#   Active: active (exited) (Result: exit-code) since Tue 2018-02-06 00:18:27 UTC; 55min ago
#   Process: 1797 ExecStart=/usr/bin/python /usr/bin/wifi_configurator.py (code=exited, status=2)
#   Main PID: 1797 (code=exited, status=2)
#   CGroup: /system.slice/wifi.service


echo "Performing network tasks"
update-rc.d -f hostapd remove
systemctl disable hostapd
pkill hostapd
sleep 1
ifconfig wlan0 down
sleep 1
ip addr flush dev wlan0 # Might only need to be run once
sleep 1
wpa_supplicant -B -Dnl80211 -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
sleep 1
ifconfig wlan0 up
sleep 3
echo ""
ifconfig wlan0 | wall -n
echo "DONE"


