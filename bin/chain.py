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
            if task.completed: 
                mark = "+"
            if i == (self.current+1):
                mark = "=>"
            print("{}#{}: {}".format(mark, i, task))
            i += 1

    def sum_task_interaval(self, to=-1):
        s = 0
        if to == -1:
            to = len(self.tasks)
        for i in range(0, to):
            if self.tasks[i].completed:
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
            self.save_sate()


    def clear_tasks(self):
        self.tasks = []
        self.time_sum = 0

    def maketask(self, text, interval):
        self.tasks.append(Task("{} | {}".format(text, interval), self))
        self.time_sum += interval
        return self

    def save_sate(self):
        if not os.path.exists(CONFIG): 
            open(CONFIG, 'w')
        lines = open(CONFIG).readlines()
        if lines == []:
            lines.append("")
        #print(lines)
        line = self.make_state_str()
        date = getdate()
        # if no today - append
        if lines[-1].find(date) < 0:
            #print("no")
            lines.append(line)
        else:
        # if line exist - rewrite
            lines[-1] = line
        with open(CONFIG, 'w+') as fout:
            fout.write("".join(lines))

    # TODO
    def load_last(self):
        if not os.path.exists(CONFIG): return False
        # read last line
        line = open(CONFIG).readlines()[-1]
        # check today
        if line.find(getdate()) < 0: return False
        #print(line)
        state = line.split(":")[1].strip()
        current = int(state.split(".")[0])
        self.current = current - 1
        completed = state.split(".")[1].strip().split(" ")
        if completed == [""]: return 
        for task_index in completed:
            task_index = int(task_index)
            self.tasks[task_index-1].completed = True


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
    VAL = 10
    TRAIN = 5
    ENGLISH = 10
    chain.maketask("Warmup", 5)
    chain.maketask("Remember target", 1)
    chain.maketask("Read", 5)
    chain.maketask("NBack", 2)
    chain.maketask("Breathe", 1)
    #chain.maketask("Start. training set 1" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("English. Grammar" , VAL)
    chain.maketask("Read Math. Poya" , VAL)
    #chain.maketask("Start. training set 2" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Dev books" , VAL)
    chain.maketask("Do Phisic" , VAL)
    #chain.maketask("Start. training set 3" , TRAIN)
    chain.maketask("Do Math Research" , VAL)
    chain.maketask("Geometry" , VAL)
    chain.maketask("Do English. Audio listen and analyze" , VAL)
    #chain.maketask("Start. training set 4" , TRAIN)
    chain.maketask("Do Math" , VAL)
    chain.maketask("Do Phisic" , VAL)
    chain.maketask("Do Math" , VAL)
    #chain.maketask("Start. training set 5" , TRAIN)
    chain.maketask("Geometry" , VAL)
    chain.maketask("Dev Card" , VAL)
    chain.maketask("English. Writing. Translate" , VAL)
    #chain.maketask("Start. training set 6" , TRAIN)
    #path_two_add(chain)
    chain.load_last()
    # E: 30   M: 40  G: 20  D: 20

def path_two_add(chain):
    VAL = 10
    chain.maketask("Read Math. Poya" , VAL)

if __name__ == "__main__":
    #TEST = True
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
