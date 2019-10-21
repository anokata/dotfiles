import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start

# Будет вызываться регулярно, каждые 5 минут.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.

TASK_GEO_INTERVAL = 8
MEDITATE_INTERVAL = 5
TRAIN_INTERVAL = 3
TASK_INTERVAL = 15
READ_INTERVAL = 10
END_TEXT = ["end. end", False]
TASK_TEXT = ["start. mathematical task", True]
busy_minutes = 0
tasks_count = 0

def make_schedule_one():
    # TODO Попробовать сдвоенные задания с переменкой 1-2мин
    # 7:00 breakfast, 12 dinner, 17 supper
    # 10:40/14 - Shoping Time
    make_task("6:10", ["Good morning. Read in voice. theorem. poem. stih. english."], 0, False)
    #make_task("6:15", ["Food. Drink. Water."], 0, False)
    make_task("6:20", ["Warmup"], 5)
    make_task("6:30", ["Repeat. Affirmate."], 0)
    make_task("6:35", ["Morning. training set 0"], TRAIN_INTERVAL)
    make_task("6:40", ["Morning. training running"], 0)
    make_task("7:09", ["Start. geometry task "], TASK_GEO_INTERVAL)
    make_task("7:19", ["Start. N. Back excercise"], 0, False)
    make_task("7:26", ["Start. Speak exercise with english vowels"], 0, False)
    make_task("7:32", ["Begin. Meditate"], MEDITATE_INTERVAL)
    make_task("7:39", TASK_TEXT, TASK_INTERVAL)
    make_task("8:18", ["Start. Read and Learn Physic"], READ_INTERVAL)
    make_task("8:30", TASK_TEXT, TASK_INTERVAL)
    make_task("9:00", ["Start. training set 1"], TRAIN_INTERVAL)
    make_task("9:18", ["Start. Read and Learn Physic"], READ_INTERVAL)

    #make_task("9:30", TASK_TEXT, TASK_INTERVAL)
    #make_task("9:46", ["Start. Learn English"], READ_INTERVAL, False)
    #make_task("10:00", TASK_TEXT, TASK_INTERVAL)
    make_task("9:30", TASK_TEXT, TASK_INTERVAL)
    make_task("9:46", TASK_TEXT, TASK_INTERVAL, False)
    make_task("10:02", ["Start. Learn English"], READ_INTERVAL, False)

    make_task("10:17", ["Begin. Read mathematic book"], READ_INTERVAL, False)
    make_task("10:30", ["Start. Read and Learn Physic"], READ_INTERVAL, False)
    make_task("10:41", ["Start. Read and Learn Physic"], READ_INTERVAL, False)

    make_task("11:00", ["Begin. training set 2"], TRAIN_INTERVAL)
    make_task("11:06", ["Start. training set Core 1"], TRAIN_INTERVAL)
    #make_task("11:10", ["Begin. "], )
    make_task("11:34", ["Begin. geometry task"], TASK_GEO_INTERVAL)
    make_task("11:45", ["Start. Affirmate. write some new."], 0, False)
    make_task("11:47", ["Begin. Meditate"], MEDITATE_INTERVAL, False)

    #make_task("12:00", TASK_TEXT, TASK_INTERVAL)
    #make_task("12:17", ["Begin. Read book math."], READ_INTERVAL)
    #make_task("12:31", TASK_TEXT, TASK_INTERVAL)
    make_task("12:00", TASK_TEXT, TASK_INTERVAL)
    make_task("12:16", TASK_TEXT, TASK_INTERVAL, False)
    make_task("12:33", ["Begin. Read book math."], READ_INTERVAL)

    make_task("13:00", ["Start. training set 3"], TRAIN_INTERVAL)
    make_task("13:08", ["Start. geometry task "], TASK_GEO_INTERVAL)
    make_task("13:19", ["Begin. Hardest. Math task"], TASK_GEO_INTERVAL)
    make_task("13:30", TASK_TEXT, TASK_INTERVAL)
    make_task("14:00", TASK_TEXT, TASK_INTERVAL)
    make_task("14:30", ["Start. training set Back"], TRAIN_INTERVAL)
    make_task("14:35", ["Start. geometry task."], TASK_GEO_INTERVAL)
    make_task("14:46", ["Start. Number theory task."], TASK_GEO_INTERVAL) # одну может 20 мин *2
    make_task("14:57", ["Repeat. Affirmate."], 0)
    make_task("15:00", ["Start. training set 4"], TRAIN_INTERVAL)
    make_task("15:10", ["Start. Write unsolved task."], 0)
    make_task("15:15", ["Start. Read and Learn Physic"], READ_INTERVAL)

    #make_task("15:30", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL)
    #make_task("15:55", ["Start. training Biceps"], 0, False)
    #make_task("16:00", TASK_TEXT, TASK_INTERVAL)
    #make_task("16:17", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL)
    make_task("15:30", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL)
    make_task("15:42", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL)
    make_task("15:55", TASK_TEXT, TASK_INTERVAL)
    make_task("16:11", ["Start. training Biceps"], 0, False)

    make_task("16:30", ["Start. Learn English"], READ_INTERVAL)
    make_task("17:00", ["Start. training set 5"], TRAIN_INTERVAL)
    make_task("17:10", ["Start. geometry task "], TASK_GEO_INTERVAL) # G
    make_task("17:30", TASK_TEXT, TASK_INTERVAL)
    make_task("17:47", ["Start. geometry task "], TASK_GEO_INTERVAL) # G
    make_task("17:58", ["Start. training shoulders"], 0, False)
    make_task("18:00", TASK_TEXT, TASK_INTERVAL)
    make_task("18:17", ["Start. read. Literature. "], 5)
    #make_task("18:20", ["Begin. "], )
    make_task("18:25", ["Start. Read and Learn Physic"], READ_INTERVAL)
    #make_task("18:40", ["Begin. Math excercise. Object property"], 0)
    make_task("19:00", ["Start. training set Core 2"], TRAIN_INTERVAL)
    make_task("19:10", ["Start. Speak english exercise vowels"], 0, False)
    #make_task("19:10", ["Begin. READ."], , END_TEXT)
    make_task("19:20", TASK_TEXT, TASK_INTERVAL)
    make_task("19:47", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL)
    make_task("20:00", ["Start. Learn English"], READ_INTERVAL)
    make_task("20:15", ["Begin. Chistopisanie."], 0)
    make_task("20:20", ["Repeat. Affirmate."], 0)
    #make_task("20:20", ["Begin. "], )
    #make_task("20:40", ["Begin. "], )
    #make_task("21:00", ["Begin. "], )
    make_task("21:20", ["Start. Read mathematic book"], READ_INTERVAL)
    make_task("21:35", ["Start. Number theory task."], TASK_GEO_INTERVAL)
    make_task("22:00", ["Start. training for night"], TRAIN_INTERVAL)


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
def make_task(time, arg, interval, prepare=True, end_arg=END_TEXT, fun=say):
    # add prepare
    if prepare:
        sched[add_interval(time, -1)] = [say, ["Prepare!", False]]
    # add main task
    sched[time] = [fun, arg]
    if interval > 0:
        time = add_interval(time, interval)
        sched[time] = [fun, end_arg]
        # stat:
        global busy_minutes, tasks_count
        busy_minutes += interval
        tasks_count += 1

# Global schedule
sched = { }

make_schedule_one()

run_schedule(sched)
if __name__ == "__main__":
    #make_task(getnow(), ["a", True], 1) 
    #run_schedule(sched)
    #print(sched)
    for time, task in sched.items():
        if task[1][0] != "Prepare!" and task[1][0] != "end. end": #fix + interval
            print("{} {}".format(time, task[1][0]))
    print("tasks: {}\nminutes: {}".format(tasks_count, busy_minutes))
    print("hours: {}h{}m".format(busy_minutes // 60, busy_minutes % 60))
