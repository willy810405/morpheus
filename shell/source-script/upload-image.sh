#!/bin/bash

MORPHEUS_URL="morpheus.hpe-taiwan-cic.net"
TOKEN="6a32ed32-8724-493f-a5fa-3113cabb8f7d"

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
              read -p "Enter the virtual_image_id: " virtual_image_id 
		# load folder files
                for file in /root/centos-7_9/*; do
                    if [ -f "$file" ]; then
                        upload_file "$file"
                    fi
                done
                ;;
            "Ubuntu 20.04")
		read -p "Enter the virtual_image_id: " virtual_image_id
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
