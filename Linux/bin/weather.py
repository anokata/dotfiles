import subprocess
import xml.etree.ElementTree as ET
import requests as req
exc = subprocess.getoutput
place = 'Russia/Yaroslavl/Rybinsk/'
place2 = 'Russia/Krasnodar/Sochi/'

def get_day():
    # получаем текущую дату - день.
    day = int(exc('date +%d'))
    hour = int(exc('date +%H'))
    if 18 < hour:
        day = int(exc('date --date="1 day" +%d'))
    return day


def getWeather(place):
    day = get_day()
    url = 'http://www.yr.no/place/{}forecast_hour_by_hour.xml'.format(place)
    # Берём данные xml.  weatherdata.forecast.tabular .time
    try:
        res = req.get(url)
        frc = ET.fromstring(res.text)
        fore = frc.find('forecast').find('tabular').findall('time') 
    except:
        print("Что-то пошло не так")
        return (0,0,0)
    avgTemp = 0
    periods = 0
    perc = 0
    wind = 0
    # выбираем узлы time from для текущего дня.
    for x in fore:
        foreDay = int(x.get('from').split('-')[2].split('T')[0])
        if foreDay == day:
            temp = float(x.find('temperature').get('value'))
            avgTemp += temp
            periods += 1
            perc += float(x.find('precipitation').get('value'))
            wind += float(x.find('windSpeed').get('mps'))
    # из данных temperature value вычисляем среднее
    if periods == 0: return (0,0,0)
    avgTemp = avgTemp / periods
    wind /= periods
    return (avgTemp, perc, wind)

def say_weather(place):
    temp, perc, wind = getWeather(place)
    print("Сегодняшняя средняя погода в %s: T: %.1f  Осадки: %.1f  Ветер: %.1f м/c" %
            (place, temp, perc, wind))

if __name__ == '__main__':
    print(getWeather(place))
    say_weather(place2)
