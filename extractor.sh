#! /bin/bash

# $1 is the time to start extraction , for example 08:53
# $2 is the name of the file

lineNumber=$(grep -n -m1 $1 $2 | cut -f1 -d:)

while read -r line; do
    echo "$line"
done < <(tail -n +$lineNumber $2)
