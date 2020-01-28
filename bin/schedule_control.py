#!/usr/bin/env python3
# run
# schedule_add.py "Start geometry task" 5 1
PATH="/home/ksi/doc/dayschedule.py"
#PATH="/home/ksi/ram/dayschedule.py"

MATH_TEXT = "Start. mathematical task"
DEV_TEXT = "Start. Develop projectcs."
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
    curses.init_pair(1, curses.COLOR_GREEN, curses.COLOR_BLACK)
    main_loop(stdscr)
    stdscr.refresh()
    #stdscr.getkey()

def main_loop(stdscr):
    make_task_table = { # key: [name, text, interval, delta]
            't': ['Training', "Start. Training", 2, 5],
            'T': ['Training', "Start. Training", 2, 2],
            'm': ['Math\t(10)', MATH_TEXT],
            'M': ['Math\t(10) over 2min', MATH_TEXT, 10, 2],
            'g': ['Geometry\t(10)', GEOM_TEXT],
            'G': ['Geometry\t(10) over 2min', GEOM_TEXT, 10, 2],
            'd': ['Dev\t(10)', DEV_TEXT],
            'D': ['Dev\t(10) over 2min', DEV_TEXT, 10, 2],
            'p': ['Physic\t(10)', PHYSIC_TEXT],
            'P': ['Physic\t(10) over 2min', PHYSIC_TEXT, 10, 2],
            'e': ['English\t(10)', ENGLISH_TEXT],
            'E': ['English\t(10) over 2min', ENGLISH_TEXT, 10, 2],
            'r': ['Read\t(10)', "Read"],
            'i': ['Meditate\t(5)', "Meditate. Concentrate on math, tasks and develop", 5, 2],
    }
    while True:
        stdscr.clear()
        redraw(stdscr)
        i = 2
        stdscr.addstr(i, 0, "(s) - Stat")
        i+=1
        for key, param in make_task_table.items():
            if key.isupper(): continue
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
        if c == ord('s'):
            show_stat(stdscr)
        param = make_task_table.get(chr(c), False)
        if param:
            text = param[1]
            interval = 10
            delta = 5
            if len(param) > 2:
                interval = param[2]
                delta = param[3]
            make_task_plan(stdscr, text, interval, delta)

# TODO last 10 days, current month, last 3 months. group by tasks + sum
def show_stat(stdscr):
    sched = read_schedule()
    past = filter_tonow(sched)
    stdscr.clear()
    stdscr.refresh()
    stdscr.addstr(0, 0, 'Current day:')
    stdscr.addstr(1, 0, 'English: {}'.format(countTask(sched, ENGLISH_TEXT)))
    stdscr.addstr(2, 0, 'Develop: {}'.format(countTask(sched, DEV_TEXT)))

    stdscr.addstr(10, 1, "Sum:\t{}".format(calcSumInterval(past)))
    stdscr.getch()

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
    stdscr.addstr(bottom-4, 1, "Всё я могу!", curses.color_pair(1))

    # Отсеять до настоящего момента
    sched = read_schedule()
    past = filter_tonow(sched)
    stdscr.addstr(bottom-1, 0, "{}/{}".format(calcCount(past), calcCount(sched)))
    stdscr.addstr(bottom-1, 7, "Min:{}/{}".format(calcSumInterval(past), calcSumInterval(sched)))
    stdscr.addstr(bottom-1, 20, "Target:{}/{}".format(calcSumInterval(past), 100))
    stdscr.addstr(bottom-1, 35, mark(past))
    stdscr.addstr(bottom-2, 0, "Next:" + next_task(sched))

    # draw last days
    left = 27
    weekCountAvg = 0
    weekSumAvg= 0
    stdscr.addstr(0, left, "Last 10 day (TSK#Min)")
    stdscr.addstr(1, left, "Task count|minutes")
    for i in range(1, 11):
        # load past day sced
        lastday = getLastDay(i)
        # show task num; minutes
        if lastday != {}:
            count = calcCount(lastday)
            sumint = calcSumInterval(lastday)
            stdscr.addstr(1+i, left, "  #{}      {}".format(count, sumint))
            weekCountAvg += count
            weekSumAvg += sumint
    weekCountAvg = round(weekCountAvg / 7)
    weekSumAvg = round(weekSumAvg / 7)
    stdscr.addstr(12, left, "AVG: #{}    {}".format(weekCountAvg, weekSumAvg))

    left = 54
    stdscr.addstr(0, left, "Last weeks sum/avg")
    for i in range(0, 4):
        tasks = 0
        minutes = 0
        for d in range(0, 7):
            daysched = getLastDay(i*7 + d)
            tasks += calcCount(daysched)
            minutes += calcSumInterval(daysched)
        stdscr.addstr(1+i, left, "  #{} {} / #{} {}".format(tasks, minutes, round(tasks/7), round(minutes/7)))
    
    top = i
    monthday = 30
    stdscr.addstr(7, left, "Last months sum")
    for i in range(0, 3):
        tasks = 0
        minutes = 0
        for d in range(0, monthday):
            daysched = getLastDay(i*monthday + d)
            tasks += calcCount(daysched)
            minutes += calcSumInterval(daysched)
        stdscr.addstr(5+i+top, left, "  #{} {} / #{} {}".format(tasks, minutes, round(tasks/monthday), round(minutes/monthday)))

    left = 80
    stdscr.addstr(0, left, "Math, Dev, ...")

def mark(past):
    return "({})".format("I" * (calcSumInterval(past) // 100))

def next_task(sched):
    for time, task in sched.items():
        if schedule.isRealTask(task) and not isTimePast(time):
            return "{} @ {}".format(task[1][0], time)
    return ""

def filter_real(sched):
    r = {}
    for time, task in sched.items():
        if schedule.isRealTask(task):
            r[time] = task
    return r


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
def read_schedule(date=False):
    if date:
        functionName = "date_" + date
    else:
        functionName = "date_" + sched_add.getDate()
    exec(open(PATH).read())
    schedule.sched = {}
    if sched_add.isNowdayExist(date):
        eval(functionName + "()")
    return schedule.sched

def getLastDay(n=1):
    lastdate = datetime.datetime.now() - datetime.timedelta(days=n)
    lastdate = sched_add.getDate(lastdate)
    s = read_schedule(lastdate)
    return filter_real(s)

def countTask(sched, s):
    n = 0
    for time, task in sched.items():
        if schedule.isRealTask(task):
            if (getTaskStr(task).find(s) >= 0):
                n += 1
    return n

def getTaskStr(task):
    return task[1][0]

#print(countTask(read_schedule(), 'Dev'))
# Main
wrapper(main)

