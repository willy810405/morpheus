#!/bin/bash

MORPHEUS_URL="morpheus.hpe-taiwan-cic.net"
TOKEN="6a32ed32-8724-493f-a5fa-3113cabb8f7d"

curl -k --request POST \
     --url https://$MORPHEUS_URL/api/virtual-images \
     --header "accept: application/json" \
     --header "authorization: Bearer $TOKEN" \
     --header "content-type: application/json" \
     --data '
{
  "virtualImage": {
    "isCloudInit": true,
    "installAgent": true,
    "osType": {
      "id": 34
    },
    "visibility": "public",
    "isAutoJoinDomain": false,
    "virtioSupported": true,
    "vmToolsInstalled": true,
    "isForceCustomization": false,
    "trialVersion": false,
    "isSysprep": false,
    "name": "CentOS 7.9",
    "imageType": "vmware"
  }
}
'


