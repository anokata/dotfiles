
alias cdn3="cd $WORK_DIR/ndw3-without-isw/"
alias cdn2="cd $WORK_DIR/ndw2/"
alias cdns="cd $WORK_DIR/ndw3-storybook/"

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
alias ndm-test="npm run ng-test"
alias ndm-add-vland="ndm-ssh-local-default interface GigabitEthernet0/Vlan5"
alias ndm-del-vland="ndm-ssh-local-default no interface GigabitEthernet0/Vlan5"
alias ndm-add-vlan="ndm-ssh-local interface GigabitEthernet0/Vlan5"
alias ndm-del-vlan="ndm-ssh-local no interface GigabitEthernet0/Vlan5"
alias ndm-add-modemd="ndm-ssh-local-default interface UsbModem2"
alias ndm-del-modemd="ndm-ssh-local-default no interface UsbModem2"
alias ndm-add-modem="ndm-ssh-local interface UsbModem2"
alias ndm-del-modem="ndm-ssh-local no interface UsbModem2"
alias ndm-add-modem-cdc="ndm-ssh-local interface CdcEthernet8"
alias ndm-del-modem-cdc="ndm-ssh-local no interface CdcEthernet8"

alias ndm-task-status-done="echo '(done, ndw3-without-isw)' | xclip -sel c"
alias ndm-task-status-review="echo '(review, ndw3-without-isw)' | xclip -sel c"
alias ndm-task-status-dev="echo '(dev, ndw3-without-isw)' | xclip -sel c"
alias ndm-test-domain="npm run ng-test src/domain/pages/"
alias ndm-opkg="ssh root@192.168.1.1 -p 222"

alias ndm-git-clone-ndw2="cd $WORK_DIR; git clone $WORK_REPO_NDW2"
alias ndm-git-clone-ndw3="cd $WORK_DIR; git clone $WORK_REPO_NDW3"
