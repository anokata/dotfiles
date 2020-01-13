#!/usr/bin/env python
import subprocess
exc = subprocess.getoutput
import random
words = [
        "cats",
        "dogs",
]

word = random.choice(words)
offset = str(random.randint(1,10))
print(word, offset)
exc("googleimage " + word + " " + offset)
