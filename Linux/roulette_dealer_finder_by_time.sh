#!/bin/bash
cd /home/sysadmin/Documents/Lucky_Duck_Investigation/Roulette_Loss_Investigation/Dealer_Analysis
awk -F' ' '{print $1, $2, $5, $6}' $1_Dealer_schedule | grep "$2 $3"

