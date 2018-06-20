#!/bin/bash
# use: numbersense [min] [max] [separated?] [char] [pause]

if [ -z "$1" ]; then
    A=5
else
    A=$1
fi

if [ -z "$2" ]; then
    B=10
else
    B=$2
fi

if [ -z "$3" ]; then
    separated=0
else
    separated=$3
fi
if [ -z "$4" ]; then
    char="="
else
    char="$4"
fi
# start

C=$(expr $B - $A)

while true; do
clear
number=$(shuf -i $A-$B -n1)
x=$number
space=$(shuf -i 5-25 -n1)
vert=$(shuf -i 0-5 -n1)
printf "%${vert}s" | tr " " "\n"
printf "%${space}s"

while [ $x -gt 0 ]  ; do 
    dec=$(shuf -i 1-$x -n1)
    x=$(expr $x - $dec)
    if [ $separated -ne 0 ]; then
        printf "%${dec}s\n" |tr " " "$char"
        printf "%${space}s"
    else
        printf "%${dec}s" |tr " " "$char"
    fi
done

tput cup 0 0
#sleep 1; clear;
read input
if [ "0$input" -eq "$number" ]; then
    echo 'Good! :)'
else
    echo 'Nooo! :('
fi
echo $number
sleep 2

done
