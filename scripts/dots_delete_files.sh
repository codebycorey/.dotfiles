#!/usr/bin/env bash

# Restore backups if present
# $1 = file name
function restore_backup_bash_scripts () {

    if [ -f ~/.dotbackup/$1 ]; then
        echo "Restoring $1..."
        cp -f ~/.dotbackup/$1 ~/"$(echo "$1" | sed 's/.backup//')"
    fi

    if [ -d ~/.dotbackup/$1 ]; then
        echo "Restoring $1..."
        cp -fR ~/.dotbackup/$1 ~/$1
    fi
}

# Deletes current symlink dotfiles
# $1 = file name
function delete_symlink_files_home () {

    if [ -L ~/$1 ]; then
        echo "Deleting: ~/$1..."
        rm ~/$1
    fi
}

#  Deletes dot files and restores from backup if restore is requested
#  $1 = restore (optional)
function dots_delete_files () {

    for file in $(ls -A ./dots); do
        delete_symlink_files_home $file
    done

    if [ $# -eq 1 ] && [ $1 = 'restore' ] && [ -d ~/.dotbackup ]; then
        for file in $(ls -A ~/.dotbackup); do
            restore_backup_bash_scripts $file
        done
    fi
}
