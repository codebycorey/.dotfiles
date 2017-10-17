#!/usr/bin/env bash

until [ -e /tmp/file1 ]
do
    echo -e ". \c"
    sleep 1
done
echo "file exists"
