#!/bin/bash

read -p "Enter Morpheus URL:" MORPHEUS_URL
read -p "Enter Morpheus API Token:" TOKEN

select_os() {
    SelectName='Select OS to upload: '
    options=("CentOS 7.9" "Ubuntu 20.04" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "CentOS 7.9")
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
                        "name": "HPE CentOS 7.9",
                        "imageType": "vmware"
                      }
                    }
                    '
                ;;
            "Ubuntu 20.04")
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
                          "id": 12
                        },
                        "visibility": "public",
                        "isAutoJoinDomain": false,
                        "virtioSupported": true,
                        "vmToolsInstalled": true,
                        "isForceCustomization": false,
                        "trialVersion": false,
                        "isSysprep": false,
                        "name": "HPE Ubuntu 20.04",
                        "imageType": "vmware"
                      }
                    }
                    '
                ;;
            "Quit")
                break
                ;;
            *) echo "Invalid option $REPLY";;
        esac
    done
}

select_os

