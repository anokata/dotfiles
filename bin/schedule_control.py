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

from subprocess import getoutput as exc
import curses
from curses import wrapper
from schedule_add import planTask
import schedule_add as sched_add
import schedule
from schedule import make_task

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
            'g': ['Geometry\t(10)', GEOM_TEXT],
            'd': ['Dev\t(10)', DEV_TEXT],
            'p': ['Physic\t(10)', PHYSIC_TEXT],
            'r': ['Read\t(10)', "Read"],
    }
    while True:
        stdscr.clear()
        stdscr.addstr(0, 0, "Available tasks:\n(q) - Exit")
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

# Main
#wrapper(main)

# Читать расписание
def read_schedule():
    functionName = "date_" + sched_add.getDate()
    exec(open(PATH).read())
    if sched_add.isNowdayExist():
        eval(functionName + "()")
    return schedule.sched

read_schedule()
