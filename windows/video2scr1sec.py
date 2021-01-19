import sys
from subprocess import getoutput as start
import os
import subprocess

def execute(cmd):
    popen = subprocess.Popen(cmd, stdout=subprocess.PIPE, universal_newlines=True)
    for stdout_line in iter(popen.stdout.readline, ""):
        yield stdout_line 
    popen.stdout.close()
    return_code = popen.wait()
    if return_code:
        raise subprocess.CalledProcessError(return_code, cmd)


ffmpeg="D:\\progs\\ffmpeg-2020-09-27-git-a3a6b56200-full_build\\bin\\ffmpeg.exe"
opt=" -i {} -vf fps=1 {}\\{}%04d.jpg"
filename = sys.argv[1]
shortname = "scr_" + sys.argv[1].replace(" ", "")

if not os.path.exists(shortname):
    os.makedirs(shortname)

cmdline=ffmpeg + opt.format(filename, shortname, shortname)
print(cmdline)
#start(cmdline)
for path in execute(cmdline):
    print(path, end="")
