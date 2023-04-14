#!/bin/bash

read -p "Enter Morpheus URL:" MORPHEUS_URL
read -p "Enter Morpheus API Token:" TOKEN
read -p "Enter Virtual Image ID:" VIRTUAL_IMAGE_ID

select_os() {
    SelectName='Select OS to upload: '
    options=("CentOS 7.9" "Ubuntu 20.04" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "CentOS 7.9")
		curl -k --request POST \
     		     --url https://$MORPHEUS_URL/api/library/container-types \
     		     --header "accept: application/json" \
     		     --header "authorization: Bearer $TOKEN" \
     		     --header "content-type: application/json" \
                     --data '
		    {
  		      "containerType": {
    			"name": "HPE CentOS 7.9",
    			"shortName": "HPECentOS7.9",
    			"containerVersion": "7.9",
    			"provisionTypeCode": "vmware",
    			"virtualImageId": '$VIRTUAL_IMAGE_ID'
  			}
		    }
		    '
		;;
           "Ubuntu 20.04")
                curl -k --request POST \
                     --url https://$MORPHEUS_URL/api/library/container-types \
                     --header "accept: application/json" \
                     --header "authorization: Bearer $TOKEN" \
                     --header "content-type: application/json" \
                     --data '
                    {
                      "containerType": {
                        "name": "HPE Ubuntu 20.04",
                        "shortName": "HPEUbuntu20.04",
                        "containerVersion": "20.04",
                        "provisionTypeCode": "vmware",
                        "virtualImageId": '$VIRTUAL_IMAGE_ID'
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
