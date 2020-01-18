#!/usr/bin/env python3
import os
import datetime
import sys
# TODO OOP
PATH="/home/ksi/doc/dayschedule.py"
PATH="/home/ksi/ram/dayschedule.py"

# Значит надо расширить schedule чтобы можно было командой добавить задачу через 5 минут и отслеживать объём выполенного-запланированного.
# команда start_dev - записывает в файл расписания на текущий день, schedule его выполняет. заодно получаем дневник.
# TODO add task with arg cmd
# run day tasks in schedule.py and run for current day(if exist)

def append2sched(s):
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

def getTime(delta=5):
    now = datetime.datetime.now()
    now += datetime.timedelta(minutes=delta)
    return "{}:{}".format(preczeroformat(now.hour), preczeroformat(now.minute))

def isNowdayExist():
    date = getDate()
    fileContent = open(PATH).read()
    return fileContent.find(date) >= 0

def init():
    if not os.path.exists(PATH):
        os.mknod(PATH)

init()

def planTask(say, interval, delta=5): # Main fun
    if not isNowdayExist():
        append2sched(makeNewDayDef())
    append2sched(makeTask(getTime(delta), say, interval))

def preczeroformat(a):
    a = int(a)
    if a < 10:
        return "0{}".format(a)
    return str(a)

if __name__=="__main__":
    if len(sys.argv) < 3:
        print("no ars")
        sys.exit(0)
    say = sys.argv[1]
    interval = int(sys.argv[2])
    delta = 5
    if (len(sys.argv) > 3):
        delta = int(sys.argv[3])
    #print(say, interval)
    planTask(say, interval, delta)

