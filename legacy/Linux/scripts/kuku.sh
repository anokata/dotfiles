speaker-test -t sine -f 1000 -l 1 1>/dev/null&
zenity --notification --window-icon="info" --text="Пробил час `date +%H:%M`" --timeout=1 1>/dev/null 2>/dev/null &
