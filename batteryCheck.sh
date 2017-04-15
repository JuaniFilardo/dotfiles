#!/bin/bash
## will send a notification message when battery reaches less than 20%

##
# El problema está en que notify-send no se muestra en pantalla cuando
# es llamado por cron o por otro usuario distinto de filardo, por ejemplo
# el root. El script funciona bien, y de hecho, cron lo ejecuta, simplemente
# ocurre que notify-send no se muestra.
# Si lo ejecuto desde consola directamente, anda perfecto.
# Tiene que haber algún error en el seteo de DISPLAY.
##


#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/filardo
export DISPLAY=:0.0

## Not really necessary, but just because...
ACPI="/usr/bin/acpi"
CUT="/usr/bin/cut"
NOTIFYSEND="/usr/bin/notify-send"

#BATTINFO=`acpi -b | cut -c 12-22`
#BATTLEVEL=`acpi -b | cut -c 25-26`


BATTINFO=`${ACPI} -b | ${CUT} -c 12-22`
BATTLEVEL=`${ACPI} -b | ${CUT} -c 25-26`



if (($BATTLEVEL < 100 && "$BATTINFO" == "Discharging"));
    then
        ${NOTIFYSEND} -t 5000 -u "critical" "You're running out of battery, bud. Current level: $BATTLEVEL%" 2> /home/filardo/.errorLog.txt
        #notify-send -t 0 -u "normal" "Battery level: $BATTLEVEL%"
fi
