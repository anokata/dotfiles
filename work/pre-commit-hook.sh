#!/bin/bash
ERRORS=0

for file in "$@"
do
    if ! git diff -U2 $file | pycodestyle --diff; then
        echo $(git diff -U2 $file | pycodestyle --diff)
        ERRORS=1
    fi
done

if [[ $ERRORS = 1 ]]; then
    echo Style errors, reject!
fi
exit $ERRORS

