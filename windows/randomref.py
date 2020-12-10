import codecs
import random
from subprocess import getoutput as start
from pathlib import Path
import os
pwd = os.getcwd()
files = list(Path(".").rglob("*.*"))

n = len(files)
r = random.randint(1, n)
randomfile = pwd + ".\\" + str(files[r])
print(randomfile)
start("D:\progs\iview454_x64\i_view64.exe " + randomfile)
    
