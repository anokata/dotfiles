# most used
export KEENETIC_IP_SKIPPER="192.168.25.1"
export NODE_VERSION=22
alias cdn2="cd $WORK_DIR/ndw2/"
alias cdn4="cd $WORK_DIR/ndw4/; nvm use ${NODE_VERSION}"
alias cdn5="cd $WORK_DIR/ndw5/; nvm use ${NODE_VERSION}"
alias cdnw="cd $WORK_DIR/wireguard/"
alias cdnq="cd $WORK_DIR/qemu/"
alias wireguard-test="cdnw; sudo wg-quick up wg-test"
alias cdnisw="cd $WORK_DIR/isw/"

export SSH_PORT=22
export SSH_USER=admin
alias ndm-keenetic-telnet="telnet $KEENETIC_IP"
alias keenetic-telnet="telnet $KEENETIC_IP"
alias keenetic-ssh="ssh admin@$KEENETIC_IP -p $SSH_PORT"
alias ndm-cbox="ssh sernam@cbox.ndm9.net"
alias ndm-ssh-local="ssh admin@$KEENETIC_IP -p $SSH_PORT"
alias ndm-keenetic-ssh-local="ssh $SSH_USER@$KEENETIC_IP -p $SSH_PORT"
alias ndm-keenetic-ssh-viva="ndm-ssh-default $KEENETIC_IP_VIVA"
alias ndm-keenetic-show-arp='ndm-ssh-local show ip arp'
alias ndm-keenetic-show-route='ndm-ssh-local show ip route'
# TODO: QEMU
# TODO: Add read password from file

alias ndm-start-local="npm start $KEENETIC_IP"
alias ndm-start-local2="npx gulp serve -P $KEENETIC_IP"
alias ndm-start-local-npx="npx gulp serve -P $KEENETIC_IP"
alias ndm-start-local-on-ndw2-l10n="npm start 127.0.0.1:3000"
alias ndm-start-mobile="npm start 192.168.22.14"
alias ndm-test="npm run kn-test"
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

alias ndm-task-status-review="echo '(review, ndw3-without-isw)' | xclip -sel c"
alias ndm-task-status-dev="echo '(dev, ndw3-without-isw)' | xclip -sel c"
alias ndm-test-domain="npm run ng-test src/domain/pages/"
alias ndm-opkg="ssh root@$KEENETIC_IP -p $SSH_PORT"

alias ndm-git-clone-ndw2="cd $WORK_DIR; git clone $WORK_REPO_NDW2"
alias ndm-git-clone-ndw4="cd $WORK_DIR; git clone $WORK_REPO_NDW4"

alias ndm-yas="yarn start --addr"
