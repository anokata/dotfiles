#!/usr/bin/env python3
# run
# schedule_add.py "Start geometry task" 5 1
PATH="/home/ksi/doc/dayschedule.py"
#PATH="/home/ksi/ram/dayschedule.py"

MATH_TEXT = "Start. mathematical task"
DEV_TEXT = "Start. Read IT. Patterns. O.O.P."
GEOM_TEXT = "Start. Geometry task "
PHYSIC_TEXT = "Start. Read and Learn Physic"
ENGLISH_TEXT = "Start. Learn English"

#Для стимуляции выполнения большего сделать вехи достижения! цветные в разделе статов. И добавить общие статы по выполненному и вычисляемы характеристики силы и ума итп.
#добавить watch/notify отслежка выполненного объёма
# ждёт ввода и позволяет одной клавишей довабить какую то задачу: m через 5 минут, М через 1 минуту (математику)
# читать всё расписание по всем дням и выводить сколько дней было и каков объём
# посчитать в текущем расписании сколько задача было до текущего времени. Целевые объёмы.
# ! Поток обновляющий и отображающий

from subprocess import getoutput as exc
import curses
from curses import wrapper
from schedule_add import planTask
import schedule_add as sched_add
import schedule
from schedule import make_task
import datetime

def main(stdscr):
    stdscr.clear()
    curses.curs_set(0)
    main_loop(stdscr)
    stdscr.refresh()
    #stdscr.getkey()

def main_loop(stdscr):
    make_task_table = { # key: [name, text, interval, delta]
            't': ['Training', "Start. Training"],
            'm': ['Math\t(10)', MATH_TEXT],
            'M': ['Math\t(10) over 2min', MATH_TEXT, 10, 2],
            'g': ['Geometry\t(10)', GEOM_TEXT],
            'G': ['Geometry\t(10) over 2min', GEOM_TEXT, 10, 2],
            'd': ['Dev\t(10)', DEV_TEXT],
            'D': ['Dev\t(10) over 2min', DEV_TEXT, 10, 2],
            'p': ['Physic\t(10)', PHYSIC_TEXT],
            'P': ['Physic\t(10) over 2min', PHYSIC_TEXT, 10, 2],
            'r': ['Read\t(10)', "Read"],
    }
    while True:
        stdscr.clear()
        redraw(stdscr)
        i = 2
        for key, param in make_task_table.items():
            name = param[0]
            text = param[1]
            interval = 10
            delta = 5
            if len(param) > 2:
                interval = param[2]
                delta = param[3]
            #stdscr.addstr(i, 0, "({}) - {}".format(key, fun.__name__.replace("_", " ")))
            stdscr.addstr(i, 0, "({}) - {}".format(key, name))
            i+=1

        c = stdscr.getch()
        if c == ord('q'):
            break
        param = make_task_table.get(chr(c), False)
        if param:
            text = param[1]
            interval = 10
            delta = 5
            if len(param) > 2:
                interval = param[2]
                delta = param[3]
            make_task_plan(stdscr, text, interval, delta)

def make_task_plan(stdscr, text='test', interval=10, delta=5):
    stdscr.addstr(stdscr.getmaxyx()[0]-1, 0, text)
    planTask(text, interval, delta)
    stdscr.getch()

def redraw(stdscr):
    bottom = stdscr.getmaxyx()[0]-1
    right = stdscr.getmaxyx()[1]-1
    now = datetime.datetime.now()
    stdscr.addstr(0, 0, "Available tasks:\n(q) - Exit")
    stdscr.addstr(bottom, right-5, "{}:{}".format(now.hour, schedule.preczeroformat(now.minute)))

    # Отсеять до настоящего момента
    sched = read_schedule()
    past = filter_tonow(sched)
    stdscr.addstr(bottom-1, 0, "{}/{}".format(calcCount(past), calcCount(sched)))
    stdscr.addstr(bottom-1, 7, "Min:{}/{}".format(calcSumInterval(past), calcSumInterval(sched)))
    stdscr.addstr(bottom-1, 20, "Target:{}/{}".format(calcSumInterval(past), 100))
    stdscr.addstr(bottom-2, 0, "Next:" + next_task(sched))

def next_task(sched):
    for time, task in sched.items():
        if schedule.isRealTask(task) and not isTimePast(time):
            return "{} @ {}".format(task[1][0], time)
    return ""

def filter_tonow(sched):
    r = {}
    for time, task in sched.items():
        if schedule.isRealTask(task) and isTimePast(time, task[2]):
            r[time] = task
    return r

def isTimePast(time, interval=0):
    now = datetime.datetime.now()
    hour = now.hour
    minute = now.minute
    phour = int(time.split(":")[0])
    pminute = int(time.split(":")[1]) + interval
    if phour > hour:
        return False
    if phour < hour:
        return True
    # there phour = hour
    if minute < pminute:
        return False

    return True

def calcSumInterval(sched):
    s = 0
    for time, task in sched.items():
        if schedule.isRealTask(task):
            s += task[2]
    return s

def calcCount(sched):
    s = 0
    for time, task in sched.items():
        if schedule.isRealTask(task):
            s += 1
    return s

# Читать расписание
def read_schedule():
    functionName = "date_" + sched_add.getDate()
    exec(open(PATH).read())
    if sched_add.isNowdayExist():
        eval(functionName + "()")
    return schedule.sched

print(calcCount(filter_tonow(read_schedule())))
print(calcCount((read_schedule())))
print(read_schedule())
#print(calcSumInterval(read_schedule()))
# Main
wrapper(main)
