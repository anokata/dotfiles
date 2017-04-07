k=$(ps aux | grep $1| head -n 1 | cut -d" " -f7) && kill $k
