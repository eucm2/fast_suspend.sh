#!/bin/bash

#   Tested on : Ubuntu 16.04 LTS    
#   Date      : 19-May-2016
#                                                        
#   This program is distributed in the hope that it will be useful, 
#   but WITHOUT ANY WARRANTY; without even the implied warranty of  
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.            

set -- `zenity --title="Scheduled-action" \
    --forms \
    --text='<span foreground="green">Enter Relative time</span>'  \
    --add-entry="hours" \
    --add-entry="min" -\
    --add-entry="sec" \
    --separator=".0 " \
    --add-combo=action --combo-values="poweroff|restart|suspend|logout"`

hrs=$1
min=$2
sec=$3
action=$4

time=$hrs\h\ $min\m\ $sec\s

#Checking validity of the input :

re='^[0-9]*([.][0-9]+)?$'

if ! [[ $hrs =~ $re ]] || ! [[ $min =~ $re ]] || ! [[ $sec =~ $re ]]
then
    zenity  --error \
            --title="Invalid Input" \
            --text="You have entered an Invalid time! \n\nOnly positive integers supported"
            exit 1
fi
