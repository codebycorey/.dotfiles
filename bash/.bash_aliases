#!/bin/bash
# Personal Aliases
#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
#
#  Sections:
#  0.   Make Terminal Better (remapping defaults and adding functionality)
#  1.   Searching
#  2.   Networking
#  3.   Development
#  4.   PROCESS MANAGEMENT
#  5.   SYSTEMS OPERATIONS & INFORMATION
#
#  ---------------------------------------------------------------------------

#   -----------------------------
#   0.  MAKE TERMINAL BETTER
#   -----------------------------

alias cp="cp -iv"                           # Preferred "cp" implementation
alias mv="mv -iv"                           # Preferred "mv" implementation
alias mkdir="mkdir -pv"                     # Preferred "mkdir" implementation
alias ll="ls -FGlAhp"                       # Preferred "ls" implementation
alias less="less -FSRXc"                    # Preferred "less" implementation
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon "cd"
alias ..="cd ../"                           # Go back 1 directory level
alias c="clear"                             # c:            Clear terminal display
alias which="type -all"                     # which:        Find executables
alias path="echo -e ${PATH//:/\\n}"         # path:         Echo all executable Paths
alias show_options="shopt"                  # Show_options: display bash options settings

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside

# Fun stuff
alias cow="fortune | cowsay"                # cow           Make cow speak
alias weather="curl -4 http://wttr\.in"     # Weather:      Opens Weather App

#   ---------------------------
#   1.  SEARCHING
#   ---------------------------

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@""*" ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name "*""$@" ; }  # ffe:      Find file whose name ends with a given string


#   ---------------------------
#   2.  NETWORKING
#   ---------------------------

alias myip="curl ip.appspot.com"                    # myip:         Public facing IP Address
alias netCons="lsof -i"                             # netCons:      Show all open TCP/IP sockets
alias flushDNS="dscacheutil -flushcache"            # flushDNS:     Flush out the DNS Cache
alias lsock="sudo /usr/sbin/lsof -i -P"             # lsock:        Display open sockets
alias lsockU="sudo /usr/sbin/lsof -nP | grep UDP"   # lsockU:       Display only open UDP sockets
alias lsockT="sudo /usr/sbin/lsof -nP | grep TCP"   # lsockT:       Display only open TCP sockets
alias ipInfo0="ipconfig getpacket en0"              # ipInfo0:      Get info on connections for en0
alias ipInfo1="ipconfig getpacket en1"              # ipInfo1:      Get info on connections for en1
alias openPorts="sudo lsof -i | grep LISTEN"        # openPorts:    All listening connections
alias showBlocked="sudo ipfw list"                  # showBlocked:  All ipfw rules inc/ blocked IPs

#   -----------------------------
#   3.  Development
#   -----------------------------
# Create alias on all the folders in my workspace/code/homes directory to take me to that directory by just typing in folder
if [[ -d "${HOME}/develop" ]]; then
    for FOLDER in $(ls ${HOME}/develop/); do alias "${FOLDER}"="cd ${HOME}/develop/${FOLDER}"; done
fi
if [[ -d "${HOME}/workspace" ]]; then
    for FOLDER in $(ls ${HOME}/workspace/); do alias "dev-${FOLDER}"="cd ${HOME}/workspace/${FOLDER}"; done
fi

#   mans:   Search manpage given in agument "1" for term given in argument "2" (case insensitive)
#           displays paginated result with colored search terms and two lines surrounding each hit.             Example: mans mplayer codec
#   --------------------------------------------------------------------
mans () {
    man $1 | grep -iC2 --color=always $2 | less
}

#   ---------------------------
#   4.  PROCESS MANAGEMENT
#   ---------------------------

#   findPid: find out the pid of a specified process
#   -----------------------------------------------------
#       Note that the command name can be specified via a regex
#       E.g. findPid "/d$/" finds pids of all processes with names ending in "d"
#       Without the "sudo" it will only find processes of the current user
#   -----------------------------------------------------
findPid () { lsof -t -c "$@" ; }

#   memHogsTop, memHogsPs:  Find memory hogs
#   -----------------------------------------------------
alias memHogsTop="top -l 1 -o rsize | head -20"
alias memHogsPs="ps wwaxm -o pid,stat,vsize,rss,time,command | head -10"

#   cpuHogs:  Find CPU hogs
#   -----------------------------------------------------
alias cpu_hogs="ps wwaxr -o pid,stat,%cpu,time,command | head -10"

#   topForever:  Continual "top" listing (every 10 seconds)
#   -----------------------------------------------------
alias topForever="top -l 9999999 -s 10 -o cpu"

#   ttop:  Recommended "top" invocation to minimize resources
#   ------------------------------------------------------------
#       Taken from this macosxhints article
#       http://www.macosxhints.com/article.php?story=20060816123853639
#   ------------------------------------------------------------
alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:
#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }



#   ---------------------------------------
#   5.  SYSTEMS OPERATIONS & INFORMATION
#   ---------------------------------------

#   cleanupDS:  Recursively delete .DS_Store files
#   -------------------------------------------------------------------
alias cleanupDS="find . -type f -name "*.DS_Store" -ls -delete"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden="defaults write com.apple.finder ShowAllFiles TRUE"
alias finderHideHidden="defaults write com.apple.finder ShowAllFiles FALSE"

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu
#   -----------------------------------------------------------------------------------
alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"
