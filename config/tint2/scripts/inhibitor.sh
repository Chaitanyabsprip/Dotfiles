#!/bin/sh
    INHIBITPID=$(pgrep ~/bin/foo.sh)

    printf "%s" "$SEP1"
    if [ -z "$(pgrep foo.sh)" ]
    then
        printf "" 
    else
        printf "" 
    fi
    printf "%s" " "

