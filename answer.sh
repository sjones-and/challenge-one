#!/bin/bash

let PP=IP=NP=0
LINES=$(cat input.txt | tr -s '[:upper:]' '[:lower:]' | sed s/[^a-z]//g) 
for LINE in $LINES; do
  LINELEN=$(echo "$LINE" | awk '{print length}')
  UNIQLEN=$(echo "$LINE"  | sed 's/\(.\)/\1-/g' | tr -s '-' '\n' | sort | uniq | wc -l | tr -d '[:space:]')
  if [ $UNIQLEN -eq 26 ]; then 
    if [ $LINELEN -eq 26 ]; then 
      PP=$(($PP+1));
    else
      IP=$(($IP+1));
    fi
  else
    NP=$(($NP+1));
  fi
done

echo $((($PP*$IP)-$NP))
