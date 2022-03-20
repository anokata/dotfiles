sudo ip link set enp9s0 up
sudo systemctl start dhcpcd
# 
sleep 3
sudo pon atel
#check if exist ppp0, wait, try again
sleep 3
sudo ip route add 192.168.10.0/24 dev ppp0
sudo ip route add default dev ppp0

