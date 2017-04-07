sudo apt-get --print-uris --yes -d --reinstall install pptp-linux binutils ppp | grep "http://" |  awk '{print$1}' | xargs -I'{}' echo {} | tee files.list
