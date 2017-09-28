#!/usr/bin/env bash
# Personal Aliases
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all common script functions
#
#  ---------------------------------------------------------------------------

OS=$(UNAME=$(uname); echo ${UNAME,,})
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_FOLDER=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd)
