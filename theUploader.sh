#!/bin/bash

#this is necessary as i had an issue where because curl was outdated, it wouldnt upload. It must be up to date to run properly
sudo apt remove curl
sudo apt update
sudo apt install curl

#variables per argument passed
uploadfilename="$1" #name of the file on dropbox
file="$2" #name of the file on the computer
accesskey="$3" #access token for dropbox

curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $accesskey" \
    --header "Dropbox-API-Arg: {\"path\": \"/$uploadfilename\",\"mode\": \"add\",\"autorename\": true,\"mute\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @"$file"

exit 0

