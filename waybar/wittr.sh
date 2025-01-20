#!/usr/bin/sh
req=$(curl -s wttr.in/49504?format="%t|%l+(%c%f)+%h,+%C&units=imperial")
bar=$(echo $req | awk -F "|" '{print $1}')
tooltip=$(echo $req | awk -F "|" '{print $2}')
echo "{\"text\":\"$bar\", \"tooltip\":\"$tooltip\"}"
