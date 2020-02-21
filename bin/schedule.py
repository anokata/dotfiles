import subprocess                                                                                                      
import datetime
from subprocess import getoutput as start
import schedule_add as sched_add
#import dayschedule as 

# Будет вызываться регулярно, каждую минуту.
# Проверять время. Если есть в расписании час:минута - вызывать соответствующую функцию с аргументами.
PATH="/home/ksi/doc/dayschedule.py"
#PATH="/home/ksi/ram/dayschedule.py"

TASK_GEO_INTERVAL = 9
MEDITATE_INTERVAL = 5
TRAIN_INTERVAL = 3
TASK_INTERVAL = 16
READ_INTERVAL = 10
DEV_INTERVAL = 11
ENGLISH_INTERVAL = 10
PHYSIC_INTERVAL = 11
END_TEXT = "ok"
END_ARG = [END_TEXT, False]
TASK_TEXT = ["start. mathematical task", True]
DEV_TEXT = ["Start. Read IT. Patterns. O.O.P."]
GEOM_TEXT = ["Start. geometry task "]
PHYSIC_TEXT = ["Start. Read and Learn Physic"]
ENGLISH_TEXT = ["Start. Learn English, please"]
busy_minutes = 0
tasks_count = 0
PREPARE = "Get ready!"

def make_schedule2020():
    DEV_INTERVAL = 20 # * 4 + 
    TASK_INTERVAL = 30 # * 7 + 
    PHYSIC_INTERVAL = 20 # * 4 + 
    ENGLISH_INTERVAL = 20 # * 2 + 
    TASK_GEO_INTERVAL = 20 # * 4 + 
    # 80+210+80+40+80=490m~8h
    # +
    # d 4  t 7  e 2  p 4  g 4

    make_task("7:00", ["Repeat. Affirmate."], 0, False)
    make_task("7:03", ["Drink and read"], 0, False)
    make_task("7:20", TASK_TEXT, TASK_INTERVAL) 
    make_task("8:00", ["Start. training"], TRAIN_INTERVAL, False)
    make_task("8:30", DEV_TEXT, DEV_INTERVAL)
    make_task("8:52", ["Repeat. Affirmate."], 0, False)
    make_task("8:54", ["Start. training set 1"], TRAIN_INTERVAL, False)
    make_task("9:00", ["Food.20 minutes"], 0, False)
    make_task("9:20", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("9:41", ["Drink and read.10 minutes"], 0, False)
    make_task("9:50", ENGLISH_TEXT, ENGLISH_INTERVAL) 
    make_task("10:10", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("10:31", ["Start. training set 2"], TRAIN_INTERVAL, False)
    make_task("10:37", TASK_TEXT, TASK_INTERVAL) 
    make_task("11:18", ["Begin. Poya. Math task"], TASK_GEO_INTERVAL)
    make_task("11:40", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("12:00", ["Start. training set 3"], TRAIN_INTERVAL, False)
    make_task("12:04", ["Drink and read.10 minutes"], 0, False)
    make_task("12:12", ["Repeat. Affirmate."], 0, False)
    make_task("12:15", TASK_TEXT, TASK_INTERVAL) 
    make_task("12:45", ENGLISH_TEXT, ENGLISH_INTERVAL) 
    make_task("13:05", ["Start. training set 4"], TRAIN_INTERVAL, False)
    make_task("13:10", DEV_TEXT, DEV_INTERVAL)
    make_task("13:31", ["Drink and read.10 minutes"], 0, False)
    make_task("13:40", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("14:00", ["Start. training set 5"], TRAIN_INTERVAL, False)
    make_task("14:05", DEV_TEXT, DEV_INTERVAL)
    make_task("14:25", ["Food.20 minutes"], 0, False)
    make_task("15:00", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("15:20", TASK_TEXT, TASK_INTERVAL) 
    make_task("15:50", ["Start. training set 6"], TRAIN_INTERVAL, False)
    make_task("15:55", ["Drink and read.10 minutes"], 0, False)
    make_task("16:00", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("16:20", TASK_TEXT, TASK_INTERVAL) 
    make_task("16:50", ["Start. training set 1"], TRAIN_INTERVAL, False)
    make_task("16:55", TASK_TEXT, TASK_INTERVAL) 
    make_task("17:25", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("17:45", TASK_TEXT, TASK_INTERVAL) 
    make_task("18:15", ["Start. training set 2"], TRAIN_INTERVAL, False)
    make_task("18:20", ["Drink and read.10 minutes"], 0, False)
    make_task("18:30", TASK_TEXT, TASK_INTERVAL) 
    make_task("19:00", DEV_TEXT, DEV_INTERVAL)
    make_task("19:20", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("19:40", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("20:00", ["Food.20 minutes"], 0, False)
    make_task("20:20", ENGLISH_TEXT, ENGLISH_INTERVAL) 
    make_task("20:40", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("21:00", GEOM_TEXT, TASK_GEO_INTERVAL)
    make_task("21:20", DEV_TEXT, DEV_INTERVAL)
    make_task("21:40", ["Repeat. Affirmate."], 0, False)
    #make_task("0:00", TASK_TEXT, TASK_INTERVAL) 
    #make_task("0:00", PHYSIC_TEXT, PHYSIC_INTERVAL)
    #make_task("0:00", DEV_TEXT, DEV_INTERVAL)
    #make_task("0:00", GEOM_TEXT, TASK_GEO_INTERVAL)
    #make_task("0:00", ENGLISH_TEXT, ENGLISH_INTERVAL) 

def make_schedule_one():
    make_task("5:40", ["mathematical task", True], TASK_INTERVAL) 
    make_task("6:10", ["Good morning. Read in voice. theorem. poem. stih. english."], 0, False)
    make_task("6:15", ["Repeat. Affirmate."], 0, False)
    make_task("6:17", ["Start. N. Back excercise"], 0, False) # del? make Math
    make_task("6:20", ["Warmup"], 5)
    make_task("6:25", ["Start. Speak exercise with english vowels. R. L. The."], 0, False) # to 6h
    #make_task("6:35", ["Morning. training set 0"], TRAIN_INTERVAL) # task before?
    #make_task("6:40", ["Morning. training on street air"], 0)
    make_task("7:17", ["Read in voice math"], 0, False)
    make_task("7:20", TASK_TEXT, TASK_INTERVAL*2) 
    # 20m !
    make_task("8:00", ["Start. training"], TRAIN_INTERVAL, False)
    make_task("8:17", PHYSIC_TEXT, PHYSIC_INTERVAL)
    make_task("8:27", ["Start. training"], TRAIN_INTERVAL, False)
    make_task("8:30", TASK_TEXT, TASK_INTERVAL)
    make_task("8:48", DEV_TEXT, DEV_INTERVAL*2)
    make_task("9:11", ["Start. training set 1"], TRAIN_INTERVAL, False)
    make_task("9:15", ["Repeat. Affirmate."], 0, False)
    make_task("9:17", ["Begin. Meditate"], MEDITATE_INTERVAL, False)
    # 15m - 10
    make_task("9:25", ["Start. training"], TRAIN_INTERVAL, False)
    make_task("9:28", TASK_TEXT, TASK_INTERVAL*2) # swat ot phy?
    make_task("10:02", ENGLISH_TEXT, ENGLISH_INTERVAL*2, False) 
    make_task("10:24", PHYSIC_TEXT, PHYSIC_INTERVAL*2)
    make_task("10:47", ["Begin. training set 2"], TRAIN_INTERVAL)
    # 30m - 10 and add task geo or dev x2
    make_task("11:23", ["Repeat. Affirmate."], 0, False)
    make_task("11:25", ["Begin. Meditate"], MEDITATE_INTERVAL, False)
    make_task("11:31", GEOM_TEXT, TASK_GEO_INTERVAL*2)
    make_task("11:51", TASK_TEXT, TASK_INTERVAL*2)
    #?
    #make_task("12:24", TASK_TEXT, TASK_INTERVAL, False)
    make_task("12:26", ["Start. training"], TRAIN_INTERVAL, False)
    make_task("12:42", ["Start. training set 3"], TRAIN_INTERVAL, False)
    make_task("12:46", ["Begin. Meditate"], MEDITATE_INTERVAL, False)
    #make_task("12:46", ["Begin. Poya. Math task"], TASK_GEO_INTERVAL+3)
    make_task("13:02", GEOM_TEXT, TASK_GEO_INTERVAL*2)
    make_task("13:21", TASK_TEXT, TASK_INTERVAL*2)
    make_task("13:55", ["Start. training set 4"], TRAIN_INTERVAL)
    #make_task("13:58", ["English. make story."], 2)
    make_task("14:00", ["Start. Read"], TASK_GEO_INTERVAL, False)
    # 35m
    make_task("14:34", GEOM_TEXT, TASK_GEO_INTERVAL*2)
    make_task("14:53", ["Repeat. Affirmate."], 0, False)
    make_task("14:55", ["Start. training Triceps"], 0, False)
    #make_task("14:57", ["Start. Math. Reasearch Task"], 17)
    make_task("14:57", ["Begin. Meditate on Math. Inspire self"], MEDITATE_INTERVAL, False)
    # 20m 125
    make_task("15:18", DEV_TEXT, DEV_INTERVAL)
    make_task("15:29", DEV_TEXT, DEV_INTERVAL*2)
    make_task("15:53", PHYSIC_TEXT, PHYSIC_INTERVAL*2)
    make_task("16:15", ["Start. training Biceps"], 0, False)
    make_task("16:19", ENGLISH_TEXT, ENGLISH_INTERVAL*2)
    make_task("16:40", ["Start. training set 5"], TRAIN_INTERVAL)
    # 20m (145)
    make_task("17:10", GEOM_TEXT, TASK_GEO_INTERVAL*2)
    make_task("17:30", TASK_TEXT, TASK_INTERVAL*2)
    make_task("18:03", ["Start. training shoulders"], 0, False)
    make_task("18:05", PHYSIC_TEXT, PHYSIC_INTERVAL*2)
    make_task("18:28", ["Start. training set 6"], TRAIN_INTERVAL)
    # 20m (170) ~3h
    make_task("19:00", TASK_TEXT, TASK_INTERVAL*2)
    make_task("19:35", DEV_TEXT, DEV_INTERVAL*2)
    #make_task("20:05", ENGLISH_TEXT, ENGLISH_INTERVAL*2)
    make_task("20:25", PHYSIC_TEXT, PHYSIC_INTERVAL*2)
    make_task("20:47", TASK_TEXT, TASK_INTERVAL*2)
    #make_task("21:20", ["Start. Read mathematic book"], READ_INTERVAL*2)
    make_task("22:00", ["Start. warmup for night"], 0)
    make_task("22:05", ["Repeat. Affirmate."], 0)

def make_schedule_two(): # 1h=50do:10rest(offline)
    make_task("6:55", ["Meditate"], 0)
    make_task("7:00", ["Start. Warmup"], 0)
    make_task("7:04", ["Repeat. Affirmate."], 0)
    #make_task("7:20", GEOM_TEXT, 10)
    #make_task("7:30", ["Breathe. UpSide Down."], 0)
    #make_task("7:35", GEOM_TEXT, 10)

    #make_task("8:30", ["Breathe. Espander."], 0)
    #make_task("8:33", ["Concentrate. 100. look. imagine. Xaos"], 0)
    #make_task("8:36", TASK_TEXT, 10)

    make_task("8:55", ["Meditate"], 0)
    make_task("9:00", ["Repeat. Affirmate."], 0)

    make_task("9:30", ["Concentrate. 100. look. Xaos. trance."], 0)

    make_task("10:00", ["Start. training set 1"], 0)
    make_task("10:05", DEV_TEXT, 10)
    make_task("10:30", ["Breathe. Espander."], 0)
    make_task("10:55", ["Meditate"], 0)
    make_task("11:00", ["Start. training set 2"], 0)
    make_task("11:04", ["Repeat. Affirmate."], 0)
    make_task("11:20", PHYSIC_TEXT, 10)
    make_task("11:30", ["Concentrate. 100. look. Xaos. trance."], 0)
    make_task("11:33", ["Eye excercise"], 1)
    make_task("11:50", TASK_TEXT, 10)

    make_task("12:55", ["Meditate"], 0)
    make_task("13:00", ["Start. training set 3"], 0)
    make_task("13:04", ["Repeat. Affirmate."], 0)

    make_task("14:15", GEOM_TEXT, 10)
    make_task("14:25", TASK_TEXT, 10)

    make_task("14:55", ["Meditate. In Dark."], 0)
    make_task("15:00", ["Start. training set 4"], 0)
    make_task("15:04", ["Repeat. Affirmate."], 0)

    make_task("15:30", DEV_TEXT, 10)
    
    #make_task("16:00", PHYSIC_TEXT, 10)

    make_task("16:55", ["Meditate"], 0)
    make_task("17:00", ["Start. training set 5"], 0)
    make_task("17:04", ["Repeat. Affirmate."], 0)
    make_task("17:06", ["мысленно улучшай себя. Improve self in imagination."], 1)
    #make_task("17:07", PHYSIC_TEXT, 10)
    #make_task("17:18", DEV_TEXT, 10)
    #make_task("17:29", GEOM_TEXT, 10)
    make_task("18:30", ["Breathe. UpSide Down."], 0)
    make_task("18:35", GEOM_TEXT, 10)
    
    make_task("18:55", ["Meditate"], 0)
    make_task("19:00", ["Start. training set 6"], 0)
    make_task("19:04", ["Repeat. Affirmate."], 0)
    #make_task("19:30", PHYSIC_TEXT, 10)

def make_schedule_train():
    task("9:00", "Start. training set 1")
    task("9:05", "Breakfast")
    task("10:00", "Start. training set 2")
    task("11:00", "Start. training set 3")
    task("12:00", "Start. training set 4")
    task("13:00", "Dinner")
    task("14:00", "Start. training set 5")
    task("15:00", "Start. training set 6")
    task("16:00", "Start. training set 1")
    task("17:00", "Supper")
    task("18:00", "Start. training set 2")
    task("19:00", "Start. training set 3")
    task("20:00", "Start. training set 6")
    task("21:00", "Start. training set 5")

DELTA = 0 # TODO
# Не более 30 задач в день. Задача не более 40 мин.
# после задачи не менее 5 минут перерыв - доделать задачу, консолидировать, отдых (без расслабления)
def make_schedule_2020_march():
    # начинаем как в августе. постепенно.
    MATH_INTERVAL = 3
    INTERVAL = 3
    MATH = "Algebra time"
    task("7:30", "Warmup")
    task("7:40", "Read")
    task("8:30", "NBack")
    task("8:35", "Breathe")

    task("8:55", "Start. training set 1")
    task("9:00", "Breakfast")

    task("9:40", MATH, MATH_INTERVAL)
    task("11:00", "Start. training set 2")
    task("12:55", "Start. training set 3")
    task("13:00", "Dinner")
    #task("14:00", "Walking outside. 5 minutes")
    task("15:00", "Start. training set 4")
    task("16:55", "Start. training set 5")
    task("17:00", "Supper")
    task("18:55", "Start. training set 6")


def say(phrase, beep=True):
    if beep:
        #old: start("speaker-test -t sine -f 700 -l 1 -P 2 -c 1& a=$(jobs -p | head); echo $a; sleep 0.2; kill -KILL $a;")
        #start("ffplay -nodisp -autoexit ~/dotfiles/Ching4.wav")
        #start("ffplay -nodisp -autoexit ~/dotfiles/bell2.ogg")
        start("ffplay -nodisp -autoexit ~/dotfiles/bell.ogg")

    #start("flite -t '{}'".format(phrase))
    start("espeak '{}'".format(phrase))
    #start("ffplay -nodisp -autoexit ~/dotfiles/Ching3.wav")

def getnow():
    date = datetime.datetime.now()
    hour = date.hour
    minute = date.minute
    time = "{}:{}".format(hour, preczeroformat(minute))
    return time

def run_schedule(sched):
    time = getnow()
    date = datetime.datetime.now()
    hour = date.hour
    minute = preczeroformat(date.minute)
    time = "{}:{}".format(hour, minute)
    task = sched.get(time, False)
    # TODO Если нашёл две то последовательно их выполнить
    print(time, task)
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
def make_task(time, arg, interval=0, prepare=True, end_arg=END_ARG, fun=say):
    # add prepare
    if prepare:
        sched[add_interval(time, -1)] = [say, [PREPARE, False], 0]
    # add main task
    sched[time] = [fun, arg, interval]
    if interval > 0:
        time = add_interval(time, interval)
        sched[time] = [fun, end_arg, 0]
        # stat:
        global busy_minutes, tasks_count
        busy_minutes += interval
        tasks_count += 1


def task(time, arg, interval=5, prepare=True, end_arg=END_ARG, fun=say):
    make_task(time, [arg], interval, prepare, end_arg, fun)
# Global schedule
sched = { }

# read PATH and if exist make by date
def readTodaySched():
    functionName = "date_" + sched_add.getDate()
    exec(open(PATH).read())
    if sched_add.isNowdayExist():
        eval(functionName + "()")

def isRealTask(task):
    return task[1][0] != PREPARE and task[1][0] != END_TEXT

if __name__ == "__main__":
    #make_task(getnow(), ["a", True], 1) 
    readTodaySched()
    #print(sched)
    #make_schedule_2020_march() # TODO
    run_schedule(sched)
    i = 0
    for time, task in sched.items():
        if task[1][0] != PREPARE and task[1][0] != END_TEXT: #fix + interval
            i += 1
            print("{}  {} {}".format(i, time, task[1][0]))
    print("tasks: {}\nminutes: {}".format(tasks_count, busy_minutes))
    print("hours: {}h{}m".format(busy_minutes // 60, busy_minutes % 60))
    #make_task("12:44", ["Start. Number theory task."], TASK_GEO_INTERVAL) # одну может 20 мин *2
    #make_task("12:49", ["Begin. Hardest. Math task"], TASK_GEO_INTERVAL)
    #make_task("18:03", ["Begin. Math write theorem on paper."], 0)
    #make_task("18:15", ["Start. read. Literature. "], 6) # to 19?
    #make_task("11:20", ["Start. Paint. Draw. Excercises."], 5)
    #make_task("11:20", ["Start. Paint. draw. copy something."], 10)
    #make_task("11:20", ["Start. Paint. draw. impovisation."], 10)
    #make_task("14:53", ["Start. Write unsolved task."], 0, False)
    #make_task("14:57", ["Start. Paint. draw. copy something."], 10)
    #make_task("14:57", ["Start. Chess. Or checkers"], 10)
    #make_task("11:22", ["Start. Affirmate. write some new."], 0)
    #make_task("6:28", ["Begin. Chistopisanie 8"], 0)
    #make_task("22:10", ["Start. Ukulele train."], 5)
    #make_task("22:10", ["Start. Chess train."], 0)


