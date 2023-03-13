#!bin/bash

[ -z $1 ] && min_space=100 || min_space=$1

while true 
do
    clear;
    data=($(df -h / | grep -Eio "[0-9]*gi"));
    free_space=$(grep -Eo '\d+' <<< ${data[2]}) 
    Echo ${data[2]} of memory is available.
    [ $free_space -gt $min_space ] && printf "\n\033[1;92mSpace is enough\033[0m\n" || printf "\n\033[91mSpace isn't enough \033[0m\n"
    sleep 5;
done







