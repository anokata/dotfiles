import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start

# Будет вызываться регулярно, каждые 5 минут.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.

TASK_GEO_INTERVAL = 5
MEDITATE_INTERVAL = 5
TRAIN_INTERVAL = 4
TASK_INTERVAL = 14
READ_INTERVAL = 9
END_TEXT = ["end. end", False]
TASK_TEXT = ["start. mathematical task", True]

def make_schedule_one():
    # 7:00 breakfast, 12 dinner, 17 supper
    # 10:40/14 - Shoping Time
    make_task("6:20", say, ["Warmup", False], TRAIN_INTERVAL, END_TEXT)
    make_task("6:30", say, ["Repeat. Affirmate.", False], 1, END_TEXT)
    make_task("6:40", say, ["test. training set 0"], TRAIN_INTERVAL, END_TEXT)
    make_task("6:46", say, ["test. training running", False], TRAIN_INTERVAL, END_TEXT)
    make_task("7:10", say, ["Start. geometry task "], TASK_GEO_INTERVAL, END_TEXT)
    make_task("7:17", say, ["Start. N. Back excercise", False], 1, END_TEXT)
    make_task("7:26", say, ["Start. Speak exercise", False], 1, END_TEXT)
    make_task("7:32", say, ["Begin. Meditate"], MEDITATE_INTERVAL, END_TEXT)
    make_task("7:38", say, ["Repeat. Affirmate.", False], 1, END_TEXT)
    make_task("7:40", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("8:00", say, ["May. Fox. Train. pull up.", False], 1, END_TEXT)
    make_task("8:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("9:00", say, ["Start. training set 1"], TRAIN_INTERVAL, END_TEXT)
    # eat
    make_task("9:20", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
    make_task("9:31", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("9:47", say, ["Start. Learn English", True], READ_INTERVAL, END_TEXT)
    make_task("10:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("10:20", say, ["Begin. Read mathematic book", True], READ_INTERVAL, END_TEXT)
    make_task("10:31", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
    make_task("11:00", say, ["Begin. training set 2"], TRAIN_INTERVAL, END_TEXT)
    make_task("11:06", say, ["Start. training set Core 1"], TRAIN_INTERVAL, END_TEXT)
    #make_task("11:10", say, ["Begin. "], , END_TEXT)
    make_task("11:35", say, ["Begin. geometry task"], TASK_GEO_INTERVAL, END_TEXT)
    make_task("11:46", say, ["Start. Affirmate. write some new.", False], 1, END_TEXT)
    make_task("11:49", say, ["Begin. Meditate"], MEDITATE_INTERVAL, END_TEXT)
    make_task("12:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("12:16", say, ["Begin. Read book.", True], READ_INTERVAL, END_TEXT)
    make_task("12:31", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    # cook
    make_task("13:00", say, ["Start. training set 3"], TRAIN_INTERVAL, END_TEXT)
    # eat
    make_task("13:10", say, ["Start. geometry task "], TASK_GEO_INTERVAL, END_TEXT)
    make_task("13:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("14:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("14:30", say, ["Start. training set Back"], TRAIN_INTERVAL, END_TEXT)
    make_task("14:36", say, ["Start. geometry task."], TASK_GEO_INTERVAL, END_TEXT)
    make_task("14:45", say, ["Start. number theory task."], TASK_GEO_INTERVAL, END_TEXT)
    make_task("14:55", say, ["Repeat. Affirmate.", False], 1, END_TEXT)
    make_task("15:00", say, ["Start. training set 4"], TRAIN_INTERVAL, END_TEXT)
    # eat
    make_task("15:15", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
    make_task("15:30", say, ["Start. Read Algorithms. Patterns. O.O.P.", True], READ_INTERVAL, END_TEXT)
    make_task("16:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("16:16", say, ["Start. Read Algorithms. Patterns. O.O.P.", True], READ_INTERVAL, END_TEXT)
    make_task("16:30", say, ["Start. Learn English", True], READ_INTERVAL, END_TEXT)
    make_task("17:00", say, ["Start. training set 5"], TRAIN_INTERVAL, END_TEXT)
    # eat
    make_task("17:10", say, ["Start. geometry task "], TASK_GEO_INTERVAL, END_TEXT)
    make_task("17:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("18:00", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    #make_task("18:20", say, ["Begin. "], , END_TEXT)
    make_task("18:30", say, ["Start. Read Physic", True], READ_INTERVAL, END_TEXT)
    make_task("19:00", say, ["Start. training set Core 2"], TRAIN_INTERVAL, END_TEXT)
    # May eat
    #make_task("19:10", say, ["Begin. READ."], , END_TEXT)
    make_task("19:30", say, TASK_TEXT, TASK_INTERVAL, END_TEXT)
    make_task("20:00", say, ["Start. Learn English", True], READ_INTERVAL, END_TEXT)
    make_task("20:20", say, ["Repeat. Affirmate.", False], 1, END_TEXT)
    #make_task("20:20", say, ["Begin. "], , END_TEXT)
    #make_task("20:40", say, ["Begin. "], , END_TEXT)
    #make_task("21:00", say, ["Begin. "], , END_TEXT)
    make_task("21:20", say, ["Start. Read mathematic book", True], READ_INTERVAL, END_TEXT)
    make_task("21:31", say, ["Start. Number theory task."], TASK_GEO_INTERVAL, END_TEXT)
    make_task("22:00", say, ["Start. training for night"], TRAIN_INTERVAL, END_TEXT)


def say(phrase, beep=True):
    if beep:
        start("speaker-test -t sine -f 700 -l 1 -P 2 -c 1& a=$(jobs -p | head); echo $a; sleep 0.2; kill -KILL $a;")
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
    # TODO Если нашёл две то последовательно их выполнить
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

# TODO return end time возврашать время окончания +1min чтобы можно было поставить след задачу с него
# TODO dic->list чтобы была возможность в одно время несколько задач?
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

make_schedule_one()

run_schedule(sched)
if __name__ == "__main__":
    print(sched, len(sched))
    #make_task(getnow(), say, ["a", True], 1, "b")
