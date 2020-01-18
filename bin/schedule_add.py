#!/usr/bin/env python3
import os
import datetime
# TODO OOP
PATH="/home/ksi/doc/dayschedule.py"
PATH="/home/ksi/ram/dayschedule.py"

# TODO add task with arg cmd
# run day tasks in schedule.py and run for current day(if exist)

def append2sched(s):
    if not os.path.exists(PATH):
        os.mknod(PATH)
    with open(PATH, 'a') as out:
        out.write(s + '\n')

def makeTask(time, say, interval):
    task = "    make_task(\"{}\", [\"{}\"], {})".format(time, say, interval)
    return task

def getDate():
    now = datetime.datetime.now()
    return "{}_{}_{}".format(now.day, now.month, now.year)
        
def makeNewDayDef():
    return "def date_{}():\n    pass".format(getDate())

def getTime():
    now = datetime.datetime.now()
    now += datetime.timedelta(minutes=5)
    return "{}:{}".format(now.hour, now.minute)

def isNowdayExist():
    return False

print(makeNewDayDef())
print(makeTask(getTime(), "Read", 10))
#append2sched(makeNewDayDef())
#append2sched(makeTask(getTime(), "Read", 10))
