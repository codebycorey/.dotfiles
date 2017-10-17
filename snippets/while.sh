#!/usr/bin/env bash

COUNT=10
while (( COUNT > 0 ))
    do
        echo -e "$COUNT \c"
        sleep 1
        (( COUNT -- ))
    done
echo -e "\n\nFIRE!!"
