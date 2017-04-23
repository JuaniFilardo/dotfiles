#!/bin/bash

##
#   Play / Pause music depending on current status
##

state=$(playerctl status | grep Playing| wc -l)

# 0 is stopped
# 1 is playing

if (( $state == 1 )); then
    playerctl pause 2> /home/filardo/.errorLog.txt
else
    playerctl play 2> /home/filardo/.errorLog.txt
fi
exit 0
