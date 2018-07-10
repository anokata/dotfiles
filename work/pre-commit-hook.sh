#!/bin/bash
# echo $PATH
# echo $(which pycodestyle)
OPTIONS="--diff --max-line-length=120 --show-source"
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
    IS_API=$(basename $file | grep '_api.py$' > /dev/null; echo $?)
    IS_SMEV=$(echo $file | grep 'smev' > /dev/null; echo $?)
    if grep generateDS $file >/dev/null || ( (exit $IS_API) && (exit $IS_SMEV) ); then
        echo "INFO: skipping ${filename} because generated"
        continue
    fi

    if ! git diff -U0 $file | pycodestyle $OPTIONS; then
        echo $(git diff -U0 ${file} | pycodestyle $OPTIONS)
        ERRORS=1
    fi
    
    if ! git diff -U0 $file | ./checkpydoc.py ; then
        echo $(git diff -U0 $file | ./checkpydoc.py )
        ERRORS=1
    fi
    if [ $ERRORS == 0 ]; then 
        echo "INFO: ${filename} is OK"
    fi
done

if [ $ERRORS = 1 ]; then
    echo 'ERROR: Style errors, reject!'
fi
exit $ERRORS


