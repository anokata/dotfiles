#!/usr/bin/env python
import subprocess
exc = subprocess.getoutput
import random
words = [
        #"sweets",
        #"cake",
        #"cakes",
        #"water",
        #"botle, water",
        "book",
        "books",
        #"people",
        #"tokyo",
        #"miami",
        #"museum",
        #"art",
        #"music",
        #"running man",
        "weight lifting",
        #"romantic",
        "sport",
        "sport car",
        "Math",
        "math blackboard",
        "math lecture",
        "geometry",
        "big formula",
        "learning math",
        "study calculus",
        "calculus board",
        "will",
        "Воля",
        "Упорство",
        "Стремление",

]

word = random.choice(words)
offset = str(random.randint(1,10))
print(word, offset)
exc("/home/ksi/dotfiles/bin/googleimage " + word + " " + offset)

# crontab
# */1 * * * * env DISPLAY=:0 /usr/bin/python /home/ksi/dotfiles/bin/randomstart.py "/usr/bin/python /home/ksi/dotfiles/bin/randomgoogleim age.py"
