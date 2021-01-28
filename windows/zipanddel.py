from subprocess import getoutput as start
import sys
import os

shortname = sys.argv[1].replace(" ", "").replace("&", "")
filename = sys.argv[1]

zipper="D:\\progs\\7-Zip\\7z.exe" 
zipopt=" a -sdel -mx1 {}.zip \"{}\""

cmdline=zipper + zipopt.format(shortname, filename)
print(cmdline)
start(cmdline)

