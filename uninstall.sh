#!/usr/bin/env bash

source ./util/dots_delete_files.sh

# handle whether to restore or just clear out dots
if [ $# -eq 1 ] && [ $1 = "restore" ]; then
    dots_delete_files restore
else
    dots_delete_files
fi

# Create empty bash_profile if one was not backed up
if [ ! -L ~/.bash_profile ]; then
    touch ~/.bash_profile
fi
