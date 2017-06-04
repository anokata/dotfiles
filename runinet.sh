ip link set enp9s0 up
systemctl start dhcpcd
# 
sleep 1
pon atel
sleep 2
ip route add 192.168.10.0/24 dev ppp0
ip route add default dev ppp0

