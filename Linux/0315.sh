#!/bin/bash
awk -F' ' '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep "05:00:00 AM"
awk -F' ' '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep "08:00:00 AM"
awk -F' ' '{print $1, $2, $5, $6}' 0315_Dealer_schedule | grep "02:00:00 PM"
