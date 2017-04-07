dpkg-query -s $1 | grep Installed-Size | cut -d" " -f 2
