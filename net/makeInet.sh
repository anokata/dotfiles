echo "pptpsetup --create atel --server inet.atel.me --username 7802-07-2009 --password ****"
#TODO pwd input
pptpsetup --create atel --server inet.atel.me --username 7802-07-2009 --password $1
echo "create configs..."
echo -e 'lock\nnoauth\nnobsdcomp\nnodeflate\nrefuse-pap\nrefuse-eap\nrefuse-chap\nrefuse-mschap\n' > /etc/ppp/options
echo -e 'pty "pptp inet.atel.me --nolaunchpppd"\nname 7802-07-2009\nremotename atel\n file /etc/ppp/options\nipparam atel' > /etc/ppp/peers/atel
#echo "pppOptions:"
#cat /etc/ppp/options
#echo "peers:"
#cat /etc/ppp/peers/atel
echo "Try pon..."
pon atel
# TODO Test
for i in 1 2 3 4 5; do
if ip link show ppp0 >/dev/null 2>/dev/null ; then
    break
fi
echo "$i) Wait sec for ppp0..."
sleep 1
done

#echo "Wait 5sec..."
#sleep 5
echo "add default routes"
ip route add 192.168.10.0/24 dev ppp0
ip route add default dev ppp0
sleep 1
echo "Test with ping:"
ping ya.ru
echo "ok?"

