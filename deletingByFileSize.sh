#!/bin/bash

allFilesSize=0

echo "Supression de :"

for file in *
do
    if [ -f $file ]  && [[ $file != $BASH_SOURCE ]]
    then
        fileSize=$(stat -c "%s" $file)
        if [ "$fileSize" -lt "$1" ] #$1 is a parameter that the user enters to set the size
        then
            echo $file "-" $fileSize "bytes"
            rm $file
        else
            allFilesSize=$(($allFilesSize+$fileSize))
        fi
    fi
done
    echo "Le total des fichiers restant fait : " $allFilesSize "bytes"
