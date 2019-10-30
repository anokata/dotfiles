import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start

# Будет вызываться регулярно, каждые 5 минут.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.

TASK_GEO_INTERVAL = 9
MEDITATE_INTERVAL = 5
TRAIN_INTERVAL = 3
TASK_INTERVAL = 16
READ_INTERVAL = 10
DEV_INTERVAL = 11
ENGLISH_INTERVAL = 10
PHYSIC_INTERVAL = 11
END_TEXT = ["end. end", False]
TASK_TEXT = ["start. mathematical task", True]
busy_minutes = 0
tasks_count = 0

def make_schedule_one():
    # Попробовать строенные задания с переменкой 1-2мин
    #make_task("6:15", ["Food. Drink. Water."], 0, False)
    # TODO не надо долго письменных 30мин, чтением разбавлять
    #make_task("12:44", ["Start. Number theory task."], TASK_GEO_INTERVAL) # одну может 20 мин *2
    #make_task("12:49", ["Begin. Hardest. Math task"], TASK_GEO_INTERVAL)
    #netb
    # Серии без перерывов (<5min) делать и делать длиннее
    make_task("5:40", ["Maybe. mathematical task", True], TASK_INTERVAL) 
    make_task("6:10", ["Good morning. Read in voice. theorem. poem. stih. english."], 0, False)
    make_task("6:15", ["Repeat. Affirmate."], 0, False)
    make_task("6:17", ["Start. N. Back excercise"], 0, False) # del? make Math
    make_task("6:20", ["Warmup"], 5)
    make_task("6:25", ["Start. Speak exercise with english vowels. R. L. The."], 0, False) # to 6h
    make_task("6:30", ["Start. geometry task "], TASK_GEO_INTERVAL)
    #make_task("6:28", ["Begin. Chistopisanie 8"], 0)
    #make_task("6:35", ["Morning. training set 0"], TRAIN_INTERVAL) # task before?
    #make_task("6:40", ["Morning. training on street air"], 0)
    make_task("6:50", ["Wakeup fox"], 0)
    make_task("7:04", ["Start. geometry task "], TASK_GEO_INTERVAL*2)
    make_task("7:25", ["Begin. Meditate"], MEDITATE_INTERVAL)
    make_task("7:32", TASK_TEXT, TASK_INTERVAL) 
    # 30m !
    make_task("8:17", ["Start. Read and Learn Physic"], PHYSIC_INTERVAL)
    make_task("8:30", TASK_TEXT, TASK_INTERVAL)
    make_task("8:47", ["Start. Read IT. Patterns. O.O.P."], DEV_INTERVAL*2)
    make_task("9:10", ["Start. training set 1"], TRAIN_INTERVAL, False)
    # 20m - 10
    make_task("9:28", TASK_TEXT, TASK_INTERVAL*2)
    make_task("10:02", ["Start. Learn English, please"], ENGLISH_INTERVAL*2, False) 
    make_task("10:27", ["Start. Read and Learn Physic"], PHYSIC_INTERVAL*2)
    make_task("10:51", ["Begin. training set 2"], TRAIN_INTERVAL)
    # 30m - 10 and add task geo or dev x2
    make_task("11:25", ["Start. Affirmate. write some new."], 0)
    make_task("11:28", ["Begin. Meditate"], MEDITATE_INTERVAL, False)
    make_task("11:34", ["Begin. geometry task"], TASK_GEO_INTERVAL*2)
    make_task("11:54", TASK_TEXT, TASK_INTERVAL*2) #*3
    make_task("12:27", TASK_TEXT, TASK_INTERVAL, False)
    make_task("12:44", ["Start. training set 3"], TRAIN_INTERVAL, False)
    make_task("12:51", ["Begin. Uchit. Math task"], TASK_GEO_INTERVAL)
    make_task("13:02", ["Start. geometry task "], TASK_GEO_INTERVAL*2)
    # 5m
    make_task("13:25", TASK_TEXT, TASK_INTERVAL*2)
    make_task("13:58", ["Start. training set 4"], TRAIN_INTERVAL)
    # 30m
    make_task("14:34", ["Start. geometry task."], TASK_GEO_INTERVAL*2)
    make_task("14:53", ["Repeat. Affirmate."], 0, False)
    make_task("14:55", ["Start. Write unsolved task."], 0, False)
    # 10m
    make_task("15:18", ["Start. Read IT. Patterns. O.O.P."], DEV_INTERVAL) # add more to morning
    make_task("15:29", ["Start. Read IT. Develop. O.O.P."], DEV_INTERVAL*2)
    make_task("15:55", ["Start. Read and Learn Physic"], PHYSIC_INTERVAL*2)
    make_task("16:17", ["Start. training Biceps"], 0, False)
    # 10
    make_task("16:26", ["Start. Learn English"], ENGLISH_INTERVAL*2)
    make_task("16:47", ["Start. training set 5"], TRAIN_INTERVAL)
    # 15m (145)
    make_task("17:06", ["Start. geometry task "], TASK_GEO_INTERVAL*2)
    make_task("17:26", TASK_TEXT, TASK_INTERVAL*2)
    make_task("18:00", ["Start. training shoulders"], 0, False)
    # 20m (170) ~3h
    #make_task("18:15", ["Start. read. Literature. "], 6) # to 19?
    make_task("18:20", ["Start. Read and Learn Physic"], PHYSIC_INTERVAL*2)
    make_task("18:47", ["Begin. Math write theorem on paper."], 0)
    make_task("18:51", ["Start. Speak english exercise vowels"], 0, False)
    make_task("18:54", ["Start. training set 6"], TRAIN_INTERVAL)
    make_task("19:00", TASK_TEXT, TASK_INTERVAL*2)
    make_task("19:35", ["Start. Read IT. Patterns. O.O.P."], READ_INTERVAL*2)
    # Evening
    make_task("20:00", ["Start. Learn English"], ENGLISH_INTERVAL*2)
    make_task("20:25", ["Begin. Chistopisanie 8"], 0)
    #make_task("20:25", ["Start. Read and Learn Physic"], PHYSIC_INTERVAL*2)
    #make_task("20:40", TASK_TEXT, TASK_INTERVAL*2)
    #make_task("21:20", ["Start. Read mathematic book"], READ_INTERVAL*2)
    make_task("22:00", ["Start. warmup for night"], 0)
    make_task("22:05", ["Repeat. Affirmate."], 0)


def say(phrase, beep=True):
    if beep:
        # TODO? start("speaker-test -t sine -f 700 -l 1 -P 2 -c 1& a=$(jobs -p | head); echo $a; sleep 0.2; kill -KILL $a;")
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
        if int(m) >= 60:
            h = preczeroformat(str(int(h) + 1))
            m = preczeroformat(str(int(m) - 60))
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
    print(sched)
    for time, task in sched.items():
        if task[1][0] != "Prepare!" and task[1][0] != "end. end": #fix + interval
            print("{} {}".format(time, task[1][0]))
    print("tasks: {}\nminutes: {}".format(tasks_count, busy_minutes))
    print("hours: {}h{}m".format(busy_minutes // 60, busy_minutes % 60))
    #print(add_interval("15:55", 15))
