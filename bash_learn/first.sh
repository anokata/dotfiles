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

}





echo "end"
