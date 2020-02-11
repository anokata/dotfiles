#!/usr/bin/env python3
import datetime
from subprocess import getoutput as start
from threading import Thread
import time
import os
import sys
import datetime
clear = lambda: os.system('clear') 

"""
+Отображет расписание. позволяет начать цепочку.
+подходит задача - запускает её, звонок объявление
+можно поставить паузу, возобновить. когда кончится задача объявление и отображет курсор на след
+если прервал выполнение? можно начать с n задачи? или вести журнал?
+Чтобы запускать с n-ой
+авто пауза перед след
-нужно учесть задачи которые неясно сколкьо делать - зарядка - чтобы не было таймера а сам завершал. после паузы доделываю.
-задачи-комментарии
помнить номер задачи за текущий день. где хранить? файл ~/.chain_hist
Помнить сделанные задачи. отмечать и не пройденные чтобы можно вернуться и пройти.
"""

TEST = False
CONFIG = "/home/ksi/.chain_hist"
# date: current index. list of made
# 10.02.2020: 3. 1, 2

def preczeroformat(a):
    a = int(a)
    if a < 10:
        return "0{}".format(a)
    return str(a)

def ending(is_say=True):
    if is_say:
        start("espeak '{}'".format('ok'))

def starting(text, ring=True):
    if not TEST and ring:
        start("ffplay -nodisp -autoexit ~/dotfiles/bell.ogg")
    start("espeak '{}'".format(text))

class Task(Thread):
    started = True # global thread working
    paused = True
    text = "test"
    interval = 0
    seconds = 0
    chain = {}
    say_end = True
    visible = True
    completed = False

    def __init__(self, task_string, chain):
        text, interval = map(str.strip, task_string.split("|"))
        self.text = text
        self.interval = int(interval)
        if not TEST:
            self.seconds = self.interval * 60
        else:
            self.seconds = self.interval # For test
        self.chain = chain
        Thread.__init__(self)

    def __str__(self):
        return "{}. {}".format(self.text, self.interval)

    def set_rest(self):
        self.say_end = False
        self.visible = False

    def run(self):
        #self.pause_toggle()
        while self.started and self.seconds > 0:
            time.sleep(1)
            if not self.paused:
                self.seconds -= 1
                # TODO Or check time
        if self.seconds == 0:
            ending(self.say_end)
            self.chain.next_task()
            self.completed = True

    def stop(self):
        self.started = False

    def pause_toggle(self):
        self.paused = not self.paused
        if self.paused:
            print('paused')
            starting('Pause', False)
        else:
            print('started')
            starting(self.text)

class Chain:
    tasks = []
    current = -1
    started = False
    time_sum = 0

    # Create chain of tasks from input string
    def __init__(self, chain_input, start=1):
        self.tasks = []
        self.current = start - 2
        for line in chain_input.split("\n"):
            line = line.strip()
            if line: # skip empty
                task = Task(line, self)
                self.tasks.append(task)
        self.time_sum = self.sum_task_interaval()

    def make_rest_task(self):
        task = Task("Rest | 1", self)
        task.set_rest()
        return task

    def show_schedule(self):
        i = 1
        for task in self.tasks:
            if not task.visible: continue
            mark = ""
            if i == (self.current+1):
                mark = "=>"
            if task.completed: 
                mark = "+"
            print("{}#{}: {}".format(mark, i, task))
            i += 1

    def sum_task_interaval(self, to=-1):
        s = 0
        if to == -1:
            to = len(self.tasks)
        for i in range(0, to):
            s += self.tasks[i].interval
        return s

    def show_prompt(self):
        clear()
        self.show_schedule()
        task = self.get_current()
        done = self.sum_task_interaval(self.current)
        done_prc = round(done / self.time_sum * 100)
        print("Total {} min    Done {}({}%)".format(self.time_sum, done, done_prc))
        print("{}:{} {} [{}]".format(task.seconds // 60, preczeroformat(task.seconds % 60), "paused=" if task.paused else "started->", task.text))
        control_text = "enter(start)  (space)pause  s(kip)  q(uit) r(efresh) [Number](go)"
        print(control_text)
        #print(self.make_state_str()) # TEST
        #self.load_last()

    def next_task(self):
        self.current += 1
        if self.current < len(self.tasks):
            self.tasks[self.current].start()
        else:
            print("Good Night!")
            self.started = False

    def get_current(self):
        return self.tasks[self.current]

    def skip(self):
        self.get_current().stop()
        self.next_task()

    def start(self):
        self.show_prompt()
        #cmd = input()
        self.started = True
        # Now started
        self.next_task()

        while self.started:
            self.show_prompt()
            cmd = input("Command:")
            if cmd == "q":
                print('quit')
                self.started = False
                self.get_current().stop()
            elif cmd == " " or cmd == "p" or cmd == "\n":
                self.get_current().pause_toggle()
            elif cmd == "r":
                continue
            elif cmd == "s" or cmd == "n":
                self.skip()
            elif cmd.isalnum():
                self.get_current().stop()
                self.current = int(cmd)-2
                self.next_task()


    def clear_tasks(self):
        self.tasks = []
        self.time_sum = 0

    def maketask(self, text, interval):
        self.tasks.append(Task("{} | {}".format(text, interval), self))
        self.time_sum += interval
        return self

    # TODO
    def save_sate(self):
        with open(CONFIG, 'w+') as fout:
            pass
        # get last line
        # if line exist - rewrite

    def load_last(self):
        if not os.path.exists(CONFIG): return ""
        with open(CONFIG) as fin:
            content = fin.readlines()

    def make_state_str(self):
        s = "{}: {}. ".format(getdate(), self.current)
        i = 0
        for task in self.tasks:
            i += 1
            if task.completed:
                s += str(i) + " "
        return s

def getdate():
    now = datetime.datetime.now()
    date = "{}.{}.{}".format(now.day, now.month, now.year);
    return date


#Time | Say text | Interval
TestChainInput = """
Say Test | 2
Test | 3
Do work | 6
Relax | 5
"""

Path = """
    Warmup | 5
    Remember target | 1
    NBack | 2
    Breathe | 1

    Start. training set 1 | 5
Do Math | 3
    Start. training set 2 | 5
Do Math | 3
    Start. training set 3 | 5
Do Math Research | 3
    Start. training set 4 | 5
Do English | 3
Do Math | 3
    Start. training set 5 | 5
Do Phisic | 3
Do Math | 3
    Start. training set 6 | 5
"""

def path_one(chain):
    VAL = 4
    TRAIN = 5
    chain.maketask("Warmup", 5)
    chain.maketask("Remember target", 1)
    chain.maketask("NBack", 2)
    chain.maketask("Breathe", 1)
    chain.maketask("Read", 5)
    chain.maketask("Start. training set 1" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("English" , VAL)
    chain.maketask("Start. training set 2" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Dev books" , VAL)
    chain.maketask("Start. training set 3" , TRAIN)
    chain.maketask("Do Math Research" , VAL)
    chain.maketask("Geometry" , VAL)
    chain.maketask("Start. training set 4" , TRAIN)
    chain.maketask("Do English" , VAL)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Start. training set 5" , TRAIN)
    chain.maketask("Do Phisic" , VAL)
    chain.maketask("Do Math" , VAL)
    #chain.maketask("Dev Card" , VAL)
    chain.maketask("Start. training set 6" , TRAIN)

def path_two(chain):
    VAL = 7
    TRAIN = 5
    ENGLISH = 10
    chain.maketask("Warmup", 5)
    chain.maketask("Remember target", 1)
    chain.maketask("NBack", 2)
    chain.maketask("Breathe", 1)
    chain.maketask("Read", 5)
    chain.maketask("Start. training set 1" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("English" , VAL)
    chain.maketask("Read Math. Poya" , VAL)
    chain.maketask("Start. training set 2" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Dev books" , VAL)
    chain.maketask("Do Phisic" , VAL)
    chain.maketask("Start. training set 3" , TRAIN)
    chain.maketask("Do Math Research" , VAL)
    chain.maketask("Geometry" , VAL)
    chain.maketask("Do English" , VAL)
    chain.maketask("Start. training set 4" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Do Phisic" , VAL)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Start. training set 5" , TRAIN)
    chain.maketask("Geometry" , VAL)
    chain.maketask("Dev Card" , VAL)
    chain.maketask("Start. training set 6" , TRAIN)

if __name__ == "__main__":
    #TEST = True
    if not TEST:
        path = Path
    else:
        path = TestChainInput

    start_from = 1
    if len(sys.argv) > 1:
        start_from = int(sys.argv[1])
        print(start_from)

    chain = Chain(path, start=start_from)
    if not TEST:
        chain.clear_tasks()
        #path_one(chain)
        path_two(chain)
    chain.start()
