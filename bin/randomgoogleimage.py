#!/usr/bin/env python
import subprocess
exc = subprocess.getoutput
import random
words = [
        "one cat",
        "dogs",
        "sweets",
        "cake",
        "cakes",
        "water",
        "botle, water",
        "sleeping",
        "book",
        "books",
        "people",
        "tokyo",
        "music",
        "running man",
        "weight lifting",
]

word = random.choice(words)
offset = str(random.randint(1,10))
print(word, offset)
exc("googleimage " + word + " " + offset)
