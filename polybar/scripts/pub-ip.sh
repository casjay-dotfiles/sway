#!/usr/bin/env sh

# credits
# https://linuxconfig.org/polybar-a-better-wm-panel-for-your-linux-system

IP=$(curl -4 -s http://ifconfig.co/ip)

if pgrep -x openvpn > /dev/null; then
    echo VPN: $IP
else
    echo $IP
fi
