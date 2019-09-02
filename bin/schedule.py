import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start

# TODO BEEP/Ring
TRAIN_INTERVAL = 5
TASK_INTERVAL = 6
READ_TEXT = ["Start Reading", True]
READ_INTERVAL = 5
TRAIN_TEXT = ["start training", True]
END_TEXT = ["end. end"]
TASK_TEXT = ["start mathematical task", True]

# Будет вызываться регулярно, каждые 5 минут.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.

def say(phrase, beep=False):
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
        h = preczeroformat(int(time.split(":")[0]) + i)
        m = 58
        return "{}:{}".format(h, m)


def make_task(time, fun, arg, interval, end_arg):
    # add prepare
    #sched[add_interval(time, -1)] = [say, "Prepare!"]
    # add main task
    sched[time] = [fun, arg]
    if interval > 0:
        time = add_interval(time, interval)
        sched[time] = [fun, end_arg]

# Global schedule
sched = { #"9:00": [say, "start training"], "9:05": [say, "end. end"], 
        }

make_task("7:55", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("9:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)
make_task("9:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("10:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("11:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)
make_task("11:30", say, ["Privychka2", True], 0, [""])
make_task("12:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("13:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)
make_task("13:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("14:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
#make_task("14:30", say, ["Privychka3", True], 0, [""])
make_task("15:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)
#make_task("15:30", say, READ_TEXT, READ_INTERVAL, END_TEXT)
make_task("16:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("17:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)
make_task("18:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
make_task("19:00", say, TRAIN_TEXT, TRAIN_INTERVAL, END_TEXT)

#make_task("20:05", say, "test 2 ", TRAIN_INTERVAL, "test 2 ok")
#make_task(getnow(), say, ["a", True], 1, "b")
run_schedule(sched)
if __name__ == "__main__":
    print(sched)

