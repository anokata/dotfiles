#!/usr/bin/python3
#TODO: проверять первый запуск. записывать ежедневный файл, поставить в авто запуск и смотреть есть ли запись за сегодня и предлагать уже в зависимости.
import os
import subprocess
import sys
import time
work_dir = sys.path[0]
lib_dir = os.path.join(work_dir, './lib')
sys.path.append('./weather')
sys.path.append('./zametki')
sys.path.append('.')
sys.path.append(lib_dir)
import currency
import weather
import pytest
exc = subprocess.getoutput
test = len(sys.argv) > 1
home = '/home/ksi/'

def test_this():
    import random
    temp_file = '.fileN{}N.tmp'.format(random.randint(0,100))
    exc('touch {}'.format(temp_file))
    print(get_file_day(temp_file))
    exc('rm {}'.format(temp_file))

def qry():
    yn = '[y/n]:'
    r = input('Выполнить автозапуск? [y/n]')
    if r[0] != 'y':
        print('Ну ладно...')
        exit()
    print('Поехали!')

def atel_status():
    status = exc('nmcli connection show atel | grep GENERAL.STATE | cut -d: -f2 | tr -d [:blank:]')
    return status == 'activated'

def inet_on():
    if not atel_status():
        print('Подключаем интернет #1')
        #exc('inet.sh')
        exc('nmcli connection up atel')
        print('Подождём сек...')
        exc('sleep 1')

weather_csv = '/home/ksi/weather.cvs'

def get_file_day(filename):
    #TODO exists if os.
    return time.localtime(os.path.getmtime(filename)).tm_mday

def is_new(filename):
    now_day = time.localtime().tm_mday
    file_day = get_file_day(filename)
    return file_day == now_day

def is_once_nowday_started():
    log = home+'start_end.log'
    return is_new(log)

def show_weather():
    try:
        if not is_new(home+'avansert_meteogram.png'):
            pogoda()
            print('Смотри какая сегодня погода! :)')
            exc('weather.sh')
    except:
        print('no')

def pogoda():
    if (0,0,0) == weather.getWeather(weather.place):
        print("Нет погоды")
        return
    temp, perc, wind = weather.getWeather(weather.place)
    print("Сегодняшняя средняя погода: T: %.1f  Осадки: %.1f  Ветер: %.1f м/c" % (temp, perc, wind))
    #print("погода в Сочи: T: {:.1f}  Осадки: {:.1f} Ветер: {:.1f} м/c".format(weather.getWeather(weather.place2)))
    print("Запишу погоду на сегодня для статистики в ~/weather.cvs")
    dmy = exc('date +%d.%m.%Y')
    with open(weather_csv, 'at') as fout:
        fout.write(dmy + "|%.1f|%.1f|%.1f\n" % (temp, perc, wind))

def greating():
    name = subprocess.getoutput('whoami')
    hour = int(exc('date +%H'))
    if 0 < hour < 6:
        daypart = 'ночуемс'
    elif 6 < hour < 12:
        daypart = 'утра'
    elif 12 < hour < 18:
        daypart = 'дня'
    elif 18 < hour < 23:
        daypart = 'вечера'
    else:
        daypart = 'времени суток'
    print("Доброго %s %s!"%(daypart, name))
    return daypart

def stat_open():
    print('Запишем статистику')
    #statistic = '?.gnumeric'
    exc('gnumeric')

def info():
    print('Текущий курс доллара: {}'.format(currency.get_USD_RUB()))
    print('Текущий курс euro: {}'.format(currency.get_EUR_RUB()))

def start(test):
    inet_on()
    if is_once_nowday_started() and not test:
        exc('pday.py start')
        return
    exc('pday.py start')
    daypart = greating()
    show_weather()
    info()
    stat_open()
    print('Удачного %s! vim txthub/live.org' % daypart)
    input('Press enter...')

if __name__=='__main__':
    #if len(sys.argv)>1:
        #test_this()
    #else:
    start(test) 
    exc('tmux attach -t base || tmux new -s base')

#print('Установим обои')
#exc('wallpaperText.py --file "/home/ksi/txthub/doings.txt" \
    #--bg "/home/ksi/Downloads/bg1.png" --fontsize 17 \
    #--fontcolor "(10,100,0)"')
#exc('qiv -z /usr/local/share/backgrounds/black-and-white-city-skyline-buildings.jpg') 
#print('Монтируем раздел данных...')
#exc('datamount.sh')
