#!/usr/bin/python3
import os
import datetime
#import optparse
from sys import argv

log_file = 'start_end.log'
lock_file = '/var/lock/pycuslockfile_for_onestart'
io = 0

def getLog() -> io : # IO<
    if not os.path.exists(log_file):
        with open(log_file, 'wt') as fout:
            fout.write('')

    with open(log_file, 'rt') as fin:
        return fin.read()

def getLastLog(n):
    return getLog().split('\n')[-n]

def getLastLogDate(n):
    x = getLastLog(n)
    return x.split(':', 1)[1].split('T')[0].strip()

def getLastLogTime(n):
    x = getLastLog(n)
    return x.split(':', 1)[1].split('T')[1].strip().split('.')[0]

def getLastDateTime(n):
    x = getLastLog(n)
    x = x.split(':', 1)[1].strip()
    d = datetime.datetime.strptime(x, "%Y-%m-%dT%H:%M:%S.%f")
    return d


def log(string) -> io : # IO>
    with open(log_file, 'at') as fout:
        fout.write(string)
        fout.write('\n')

def getDate() -> io : # IO<
    return datetime.datetime.now().isoformat()

def logStart() -> io : # IO<>
    log('start at: ' + getDate())

def logEnd() -> io : # IO<>
    log('end at: ' + getDate())

def dayStart(a):
    if lock():
        logStart()
        sleepLog()

def dayEnd(a):
    if freeLock():
        logEnd()

def isLock():
    return os.path.exists(lock_file)

def lock():
    if not isLock():
        with open(lock_file, 'w') as f:
            f.write('')
            return True
    else:
        return False

def freeLock():
    if isLock():
        os.remove(lock_file)
        return True
    else:
        return False

def viewLog(a):
    print(getLog())

def pday():
    if len(argv) < 2:
        print('Need more arguments like: start, end...')
        exit(0)
    cmd = argv[1]
    args = ''.join(argv[2:])
    commands = {
            'start': dayStart,
            'end': dayEnd,
            'log': viewLog,
            }
    cmd_fun = commands.get(cmd, lambda x: print('no such command'))
    cmd_fun(args)
    
def getSleepTime():
    cur_date = datetime.date.today().isoformat()
    now = datetime.datetime.now()
    last_log_date = getLastLogDate(2)
    if cur_date != last_log_date:
        start = getLastDateTime(3)
        end = getLastDateTime(2)
        no_sleeps = end - start
        sleeps = now - end
        sleep_h = sleeps.seconds // (60*60)
        sleep_m = (sleeps.seconds % (sleep_h * (60*60))) // 60
        end_time = '{:02}:{:02}'.format(end.hour, end.minute)
        start_time = '{:02}:{:02}'.format(now.hour, now.minute)
        sleep_time = '{:02}:{:02}'.format(sleep_h, sleep_m)
        return end_time, sleep_time, start_time

def sleepLog():
    end, sleep, start = getSleepTime()
    sleep_log_file = 'sleep.log'
    with open(sleep_log_file, 'at') as fout:
        fout.write(end + ',' + sleep + '\n')
        fout.write(start + ',')

    #save date wake woke sleep

if __name__=='__main__':
    pday()
