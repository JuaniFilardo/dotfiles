#!/bin/bash
## will send a notification message when battery reaches less than 20%

export DISPLAY=:0.0

## Not really necessary, but just because...
ACPI="/usr/bin/acpi"
CUT="/usr/bin/cut"
NOTIFYSEND="/usr/bin/notify-send"

#BATTINFO=`acpi -b | cut -c 12-22`
#BATTLEVEL=`acpi -b | cut -c 25-26`


BATTINFO=`${ACPI} -b | ${CUT} -c 12-22`
BATTLEVEL=`${ACPI} -b | ${CUT} -c 25-26`



if (($BATTLEVEL < 20 && "$BATTINFO" == "Discharging"));
    then
        ${NOTIFYSEND} -t 5000 -u "critical" "You're running out of battery, bud. Current level: $BATTLEVEL%"
fi
