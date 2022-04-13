alias ndm-keenetic-telnet='telnet 192.168.1.1'
alias keenetic-telnet='telnet 192.168.1.1'
alias keenetic-ssh='ssh admin@192.168.1.1 -p 2022'
alias ndm-cbox='ssh sernam@cbox.ndm9.net'
alias ndm-ssh-local='ssh admin@192.168.1.1 -p 2022'
alias ndm-ssh-local-default='sshpass -f $PASSWORD_DEFAULT ssh admin@192.168.1.1 -p 2022'
alias ndm-keenetic-ssh-local='ssh admin@192.168.1.1 -p 2022'
alias ndm-keenetic-show-arp='ndm-ssh-local show ip arp'
alias ndm-keenetic-show-route='ndm-ssh-local show ip route'

alias ndm-start-local="npm start 192.168.1.1"
alias ndm-start-mobile="npm start 192.168.22.14"
alias ndm-start-test="npm run ng-test"
alias ndm-add-vlan="ndm-ssh-local-default interface GigabitEthernet0/Vlan5"
alias ndm-add-modem="ndm-ssh-local-default interface UsbModem2"
alias ndm-del-modem="ndm-ssh-local-default no interface UsbModem2"
alias ndm-del-vlan="ndm-ssh-local-default no interface GigabitEthernet0/Vlan5"
