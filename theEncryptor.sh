#!/bin/bash

file="$1"
echo "Processing $1"

echo "Enter password: "
read -s password

recursiveENC()
{
        if   [ -d "$1" ]; then #only triggers if a directory is passed
                echo "$1 is a directory";
                for FILE in "$1"/*; do
                        if [ -d "$FILE" ]; then
                                recursiveENC "$FILE"

                        elif [ -f "$FILE" ]; then
                                echo "encrypting $FILE";
                                newfile="${FILE}.enc" #the file name, just adds .enc to the end
                                openssl enc -aes-256-cbc -in "$FILE" -out "$newfile" -k "$password"
                                shred -u "$FILE" #deletes original
                        fi
                done
        else echo "$1 is not a valid folder"; #directory passed in argumentsis 
                exit 1
        fi
}
recursiveENC "$file"


