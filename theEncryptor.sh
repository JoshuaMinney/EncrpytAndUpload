  GNU nano 4.8                                                                                    encryptor2.sh                                                                                    Modified  
#!/bin/bash

file="$1"
echo "Processing $1"

echo "Enter password: "
read -s password

recursiveENC()
{
        if   [ -d "$1" ]; then
                echo "$1 is a directory";
                for FILE in "$1"/*; do
                        if [ -d "$FILE" ]; then
                                recursiveENC "$FILE"

                        elif [ -f "$FILE" ]; then
                                echo "encrypting $FILE";
                                newfile="${FILE}.enc"
                                openssl enc -aes-256-cbc -in "$FILE" -out "$newfile" -k "$password"
                                echo "origianl file deleted: $FILE" 
                                shred -u "$FILE"
                        fi
                done
        else echo "$1 is not a valid folder";
                exit 1
        fi
}
recursiveENC "$file"


