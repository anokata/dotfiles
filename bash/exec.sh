echo "read config"
source conf.sh

# store in mem (from start read in mem from file db)
echo 'make temp memory vault'
vault=$(mktemp -p /dev/shm) #or /run/user/

echo "start read from fifo"
# read loop
while read line < $FIFO; do
    # Check is line start of:
    first=''
    tail=''
    for word in $line; do
        if [ -z "$first" ]; then
            first=$word
        elif [ -z $tail ]; then
            tail="$word"
        else
            tail="$tail $word"
        fi
    done
    echo "first is $first"
    case $first in
        s) #set
            echo "save in $vault"
            echo "$tail" > $vault
            ;;
        g) #get
            echo "is $tail end."
            ;;
        *) echo "unknown command '$first' wit params '$tail'.";;
    esac
done
