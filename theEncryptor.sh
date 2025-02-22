#!/bin/bash

file="$1"
echo "$1";
recursiveENC()
{
	if   [ -d "$1" ]; then
		echo "$1 is a directory";
		for FILE in "$1"/*; do
			if [ -d "$FILE" ]; then
				recursiveENC "$FILE"

			elif [ -f "$FILE" ]; then
				echo "encrypting $FILE";
				EXTENSION="${FILE##*.}" 
				openssl enc -aes-256-cbc -in "$FILE" -out "$FILE" -k "password"
				echo "shred -u "$FILE"";
			fi
		done
	else echo "$1 is not valid";
     		exit 1
	fi
}
recursiveENC "$file"
