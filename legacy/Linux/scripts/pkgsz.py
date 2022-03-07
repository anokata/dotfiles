#!/usr/bin/python3
import os
import subprocess
exc = subprocess.getoutput
pkgsCmd = 'dpkg-query -W | cut -f1'
pkgSize = 'dpkg-query -s %s | grep Installed-Size | cut -d" " -f 2'
pkgs = exc(pkgsCmd)

sizes = list()
pkgsizes = list()
for x in pkgs.split():
    size = int(exc(pkgSize % x))
    print('. %s %i '%(x,size) )
    sizes.append(size)
    pkgsizes.append((x, size))

print('Total: %i'%sum(sizes))
input('press enter')
pkgsizes.sort(key=lambda x: x[1])
for p,s in pkgsizes:
    print(p, s)
#save it to file




