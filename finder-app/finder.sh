#!/bin/bash
SEARCHDIR="$1"
QUERY="$2"
if [ -z "$SEARCHDIR" ]; then
    echo "ERROR: SEARCHDIR not specified" > /dev/stderr
    exit 1
fi
if [ ! -d "$SEARCHDIR" ]; then
    printf "%s: no such directory\n" "$SEARCHDIR" > /dev/stderr
    exit 1
fi
if [ -z "$QUERY" ]; then
    echo "ERROR: QUERY not specified" > /dev/stderr
    exit 1
fi
fcount=0
lcount=0
function iterate { path=$1;query=$2
    old=$PWD
    cd $path
    for fso in *; do
        if [ -d $fso ]; then
            iterate "$fso" "$query"
        else
            ((fcount++))
            numlines=$(/bin/grep "$query" "$fso" | wc -l)
            ((lcount+=$numlines))
        fi
    done
    cd $old
}
iterate "$SEARCHDIR" "$QUERY"
printf  "The number of files are %i and the number of matching lines are %i" $fcount $lcount