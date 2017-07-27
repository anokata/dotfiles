#!/bin/bash
# vim: filetype=sh
assert ()                 
{                        
  lineno=$2
  E_ASSERT_FAILED=99

  if [ ! $1 ] 
  then
    echo "Assertion failed:  \"$1\""
    echo "File \"$0\", line $lineno"
    exit $E_ASSERT_FAILED
  fi  
}

max() {
    local x=$1
    local y=$2
    if [ $x -gt $y ]; then
        echo $x
    else
        echo $y
    fi
}

assert "$(max 1 2) -eq 2" $LINENO
assert "$(max 2 1) -eq 2" $LINENO
#echo $(max 3 4)

strlen() {
    str="$1"
    echo ${#str} #or ${#1}
}
assert "$(strlen "") -eq 0" $LINENO
assert "$(strlen "_") -eq 1" $LINENO
assert "$(strlen "__") -eq 2" $LINENO

isvowel() {
    vowels="aeiou"
    char="$1"
    new=${vowels/$char/}
    if [ ${#new} -eq ${#vowels} ]; then
        echo "False"
    else
        echo "True"
    fi
}


is_in_set() {
    sset="$1"
    elem="$2"
    diff=${sset/$elem/}
    if [ ${#sset} -eq ${#diff} ]; then
        echo 1
    else
        echo 0
    fi
}

assert "$(isvowel 'a') = True" $LINENO
assert "$(isvowel 'e') = True" $LINENO
assert "$(isvowel 'b') = False" $LINENO
echo $(is_in_set "abc" 'a')
echo $(is_in_set "abc" 'e')

echo "end"
