#!/usr/bin/env python
import subprocess
exc = subprocess.getoutput
import random
import sys

p = random.randint(1,3)
if (p == 1):
    print(sys.argv[1])
    print(exc(sys.argv[1]))
else:
    print("don't luck this time")
