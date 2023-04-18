#!/bin/bash

set -e

WIFI_SSID=$1
WIFI_PASSWD=$2

systemctl enable cron
systemctl enable ssh
systemctl enable resize-image #Habilitando o servico de ampliacao da imagem
systemctl enable openvpn
systemctl enable openvpn@client

systemctl disable serial-getty@ttyS0.service
systemctl mask serial-getty@ttyS0.service

# Installing libraries
# to add nmcli
sudo apt-get install network-manager
#to add ifconfig
sudo apt-get install net-tools

# List and connect to wifi
# to list wifi list
sudo nmcli device wifi list
# to connect to wifi
sudo nmcli device wifi connect $WIFI_SSID password $WIFI_PASSWD ifname wlan0