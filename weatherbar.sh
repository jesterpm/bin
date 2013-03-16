#!/bin/sh
temp=`weather --headers="Temperature" -q | awk '/Temperature/ {print $2}'`
cond=`weather --headers="Sky conditions" -q | awk '/Sky conditions/ {print $3 " " $4}'`

echo "$temp °C $cond"
