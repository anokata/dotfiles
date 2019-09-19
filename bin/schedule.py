import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start

TRAIN_INTERVAL = 5
TASK_INTERVAL = 11
TASK_GEO_INTERVAL = 3
READ_TEXT = ["Start Reading", True]
READ_INTERVAL = 7
TRAIN_TEXT = ["start training", True]
END_TEXT = ["end. end", False]
TASK_TEXT = ["start mathematical task", True]

# Будет вызываться регулярно, каждые 5 минут.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.

def say(phrase, beep=True):
    if beep:
        start("speaker-test -t sine -f 700 -l 1 -P 2 -c 1& a=$(jobs -p | head); echo $a; sleep 0.2; kill $a;")
        start("ffplay -nodisp -autoexit ~/dotfiles/bell.ogg")
    start("espeak '{}'".format(phrase))

def getnow():
    date = datetime.datetime.now()
    hour = date.hour
    minute = date.minute
    time = "{}:{}".format(hour, minute)
    return time

def run_schedule(sched):
    time = getnow()
    date = datetime.datetime.now()
    hour = date.hour
    minute = preczeroformat(date.minute)
    time = "{}:{}".format(hour, minute)
    task = sched.get(time, False)
    #print(time, task)
    if not task: return
    # call fun with arg
    task[0](*task[1])

def preczeroformat(a):
    a = int(a)
    if a < 10:
        return "0{}".format(a)
    return str(a)

def add_interval(time, i):
    if i > 0:
        h = (time.split(":")[0])
        m = preczeroformat(int(time.split(":")[1]) + i)
        return "{}:{}".format(h, m)
    else:
        h = int(time.split(":")[0])
        m = int(time.split(":")[1])
        if m != 0:
            m += i
        else:
            h -= 1
            m = 60 + i
        return "{}:{}".format(h, preczeroformat(m))


def make_task(time, fun, arg, interval, end_arg):
    # add prepare
    sched[add_interval(time, -1)] = [say, ["Prepare!", False]]
    # add main task
    sched[time] = [fun, arg]
    if interval > 0:
        time = add_interval(time, interval)
        sched[time] = [fun, end_arg]

# Global schedule
sched = { }

# 7:00 breakfast, 12 dinner, 17 supper
# 10:40 - Shoping Time
make_task("7:10", say, ["Start geometry task "], TASK_GEO_INTERVAL, END_TEXT)
make_task("7:40", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("8:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("9:00", say, ["Start training set 1"], TRAIN_INTERVAL, END_TEXT)
make_task("9:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("10:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("10:30", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
make_task("11:00", say, ["Start training set 2"], TRAIN_INTERVAL, END_TEXT)
make_task("11:30", say, ["Privychka2", True], 0, [""])
make_task("12:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("12:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("13:00", say, ["Start training set 3"], TRAIN_INTERVAL, END_TEXT)
make_task("13:10", say, ["Start geometry task "], TASK_GEO_INTERVAL, END_TEXT)
make_task("13:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("14:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
#make_task("14:30", say, ["Privychka3", True], 0, [""])
make_task("15:00", say, ["Start training set 4"], TRAIN_INTERVAL, END_TEXT)
make_task("15:30", say, ["Start. Read Algorithms", True], READ_INTERVAL, END_TEXT)
make_task("16:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("16:30", say, ["Start. Learn English", True], READ_INTERVAL, END_TEXT)
make_task("17:00", say, ["Start training set 5"], TRAIN_INTERVAL, END_TEXT)
make_task("17:10", say, ["Start geometry task "], TASK_GEO_INTERVAL, END_TEXT)
make_task("17:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("18:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("18:30", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
make_task("19:00", say, ["Start training set Core 2"], TRAIN_INTERVAL, END_TEXT)
make_task("19:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("20:00", say, ["Start. Learn English", True], READ_INTERVAL, END_TEXT)
make_task("22:00", say, ["Start training for night"], TRAIN_INTERVAL, END_TEXT)

# TODO "Start programming"

run_schedule(sched)
if __name__ == "__main__":
    print(sched)
    #make_task(getnow(), say, ["a", True], 1, "b")


