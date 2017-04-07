pptpsetup --create atel --server inet.atel.me --username 7802-07-2009 --password ??
echo 'lock\nnoauth\nnobsdcomp\nnodeflate\nrefuse-pap\nrefuse-eap\nrefuse-chap\nrefuse-mschap\n' > /etc/ppp/options
echo 'pty "pptp inet.atel.me --nolaunchpppd"\nname 7802-07-2009\nremotename atel\nfile /etc/ppp/options\nipparam atel' > /etc/ppp/peers/atel

