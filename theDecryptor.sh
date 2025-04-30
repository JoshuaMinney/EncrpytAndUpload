#!/bin/bash

file="$1"
echo "Processing $1"

echo "Enter password, this must match the password used to encrypt the files. "
read -s password #saves inputted password as variable

recursiveDEC()
{
    if [ -d "$1" ]; then
        echo "$1 is a directory" #only triggers if a directory is passed
        for FILE in "$1"/*; do
            if [ -d "$FILE" ]; then
                recursiveDEC "$FILE" #will loop again if  current focused file is a folder

            elif [[ -f "$FILE" && "$FILE" == *.enc ]]; then
                echo "decrypting $FILE"
                original="${FILE%.enc}" #removes .enc from file name
                openssl enc -d -aes-256-cbc -in "$FILE" -out "$original" -k "$password"
                shred -u "$FILE" #deletes original file
            fi
        done
    else
        echo "$1 is not a folder" #triggers if the directory passed in, in the command argument, is not valid
        exit 1
    fi
}

recursiveDEC "$file"
