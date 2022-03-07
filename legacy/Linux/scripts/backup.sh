#!/bin/bash
workdir=$HOME/txthub/Linux
files=$workdir/scripts/backup_files.txt
back_dir=/tmp/backup
backup=/tmp/backup.tar
backup_dest=$workdir
if mkdir $back_dir 2>/dev/null; then 
    echo 'no dir'
fi
for f in `cat $files`
do
    cp -r $f $back_dir
done
rm $backup 2>/dev/null
rm $backup.bz2 2>/dev/null
tar -cf $backup $back_dir
bzip2 $backup 
cp $backup.bz2 $backup_dest
