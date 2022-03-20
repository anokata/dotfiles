import codecs
import random
from subprocess import getoutput as start

with codecs.open("reflist.txt", encoding='cp1251', errors='replace') as fin:
    lines = fin.readlines()
    n = len(lines)
    r = random.randint(1, n)
    print(lines[r])
    randomfile = lines[r]
    start("D:\progs\iview454_x64\i_view64.exe " + randomfile)
