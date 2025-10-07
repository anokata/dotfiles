# Change working dir in shell to last dir in lf on exit (adapted from ranger).

function lfcd
    set tmp (mktemp)
    set fid (mktemp)

    lf -command '$printf $id > '"$fid"'' -last-dir-path="$tmp" $argv

    set id (cat $fid)
    set archivemount_dir "/tmp/__lf_archivemount_$id"

    if test -f $archivemount_dir
        # Read the file content line by line.
        cat $archivemount_dir | while read -l line
            # -l ensures line-by-line reading, handling newlines correctly.
            sudo umount $line
            rmdir $line
        end
        rm -f $archivemount_dir
    end

    # 5. Directory Change Block
    if test -f $tmp
        set dir (cat $tmp)
        rm -f $tmp

        if test -d $dir
            # Check if the desired directory exists.
            if test $dir != (pwd)
                # Only change directory if it's different from the current one.
                cd $dir
            end
        end
    end
end

