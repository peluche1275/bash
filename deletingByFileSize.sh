#!/bin/bash

echo "Supression de :"
allFilesSize=0

for i in *
do
    if [ -f $i ]
    then
        fileSize=$(stat -c "%s" $i)
        if [ "$fileSize" -lt "$1" ]
        then
            echo $i "-" $fileSize "bytes"
            # rm $i
        else
            allFilesSize=$(($allFilesSize+$fileSize))
        fi
    fi
done
    echo "Le total des fichiers restant fait : " $allFilesSize
