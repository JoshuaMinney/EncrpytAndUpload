#!/bin/bash

uploadfilename="$1"
file="$2"
accesskey="$3"

curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $accesskey" \
    --header "Dropbox-API-Arg: {\"path\": \"/$uploadfilename\",\"mode\": \"add\",\"autorename\": true,\"mute\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary "$2"

exit 0

