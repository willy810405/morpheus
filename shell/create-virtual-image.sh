#!/bin/bash

MORPHEUS_URL="morpheus.hpe-taiwan-cic.net"
TOKEN="6a32ed32-8724-493f-a5fa-3113cabb8f7d"

# check jq command, if no install jq, then install it
if ! command -v jq &> /dev/null; then
    yum -y install jq
fi

upload_file() {
    local file_path=$1
    local filename=$(basename "$file_path")

    curl -k --request POST \
         --url "https://$MORPHEUS_URL/api/virtual-images/$virtual_image_id/upload?filename=$filename" \
         --header "accept: application/json" \
         --header "authorization: Bearer $TOKEN" \
         --header "content-type: application/octet-stream" \
         --data-binary "@$file_path"
}

select_os() {
    SelectName='Select OS to upload: '
    options=("CentOS 7.9" "Ubuntu 20.04" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "CentOS 7.9")
                virtual_image_id=$(curl -k --request POST \
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
                    ' | jq ".virtualImage.id")

                # load folder files
                for file in /root/centos-7_9/*; do
                    if [ -f "$file" ]; then
                        upload_file "$file"
                    fi
                done
                ;;
            "Ubuntu 20.04")
                virtual_image_id=$(curl -k --request POST \
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
                          "id": 12
                        },
                        "visibility": "public",
                        "isAutoJoinDomain": false,
                        "virtioSupported": true,
                        "vmToolsInstalled": true,
                        "isForceCustomization": false,
                        "trialVersion": false,
                        "isSysprep": false,
                        "name": "Ubuntu 20.04",
                        "imageType": "vmware"
                      }
                    }
                    ' | jq ".virtualImage.id")

                # load folder files
                for file in /root/ubuntu-20_04_6/*; do
                    if [ -f "$file" ]; then
                        upload_file "$file"
                    fi
                done
                ;;
            "Quit")
                break
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
}

select_os

