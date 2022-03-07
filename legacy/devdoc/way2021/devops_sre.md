devops_sre

#docker
https://habr.com/ru/company/ruvds/blog/450312/
https://docs.docker.com/desktop/windows/wsl/

https://docs.microsoft.com/en-us/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package
https://docs.microsoft.com/en-us/windows/wsl/install

 wsl --export docker-desktop-data docker-desktop-data.tar
 wsl --unregister docker-desktop-data
 wsl --import docker-desktop-data X:\wslStore\ docker-desktop-data.tar --version 2

# wsl
wsl --shutdown

netsh winsock reset 
netsh int ip reset all
netsh winhttp reset proxy
ipconfig /flushdns
