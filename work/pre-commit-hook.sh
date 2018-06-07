#!/bin/bash
# echo $PATH
# echo $(which pycodestyle)
ERRORS=0
if  [ -z $(command -v pycodestyle) ]; then
    ERRORS=1
    echo 'ERROR: install pycodestyle'
    exit $ERRORS
fi

for file in "$@"
do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    if [ $extension != 'py' ]; then
        echo "INFO: skipping ${filename} because \"${extension}\""
        continue
    fi
    if ! git diff -U0 $file | pycodestyle --diff; then
        echo $(git diff -U0 ${file} | pycodestyle --diff)
        ERRORS=1
    else
        echo "INFO: ${filename} is OK"
    fi
done

if [ $ERRORS = 1 ]; then
    echo 'ERROR: Style errors, reject!'
fi
exit $ERRORS


