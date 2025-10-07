#!/bin/python3

# import sys
from subprocess import getoutput
import subprocess
import os

output = list(filter(
    lambda s: 'temp' in s,
    getoutput("redshift -p").split('\n')
))[0]
temp = 0
# print(output)

temp = int(output.split()[-1].replace("K", ""))

new_temp = temp - 300

# subprocess.run(["redshift -P -O " + str(new_temp)])
cmd = "redshift -P -O " + str(new_temp)
print(cmd)
os.system("redshift -P -O " + str(new_temp))
