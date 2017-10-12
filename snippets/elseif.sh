#!/usr/bin/env bash

## if (( $COUNT < 10 )) for numerical tests
## if [[ $USER = "root" ]] for string tests
if [[     ]]
    then
        echo "true"
  elif [[    ]]
    then
        echo "also true"
  else
        echo "false"
fi
