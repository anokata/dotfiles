#!/usr/bin/env python
import subprocess
exc = subprocess.getoutput
import random
import sys

p = random.randint(1,5)
if (p == 1):
    print(sys.argv[1])
    print(exc(sys.argv[1]))
