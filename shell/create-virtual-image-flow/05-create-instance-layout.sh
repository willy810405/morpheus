#!/bin/bash

read -p "Enter Morpheus URL:" MORPHEUS_URL
read -p "Enter Morpheus API Token:" TOKEN
read -p "Enter Container Type ID(You will get the id when running 03-create-node-type.sh)": Container_Type_ID
read -p "Enter Instance Type ID(You will get the id when running 04-create-instance-type.sh)": Instance_Type_ID


select_os() {
    SelectName='Select OS to upload: '
    options=("CentOS 7.9" "Ubuntu 20.04" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "CentOS 7.9")
		curl -k --request POST \
     		     --url https://$MORPHEUS_URL/api/library/instance-types/$Instance_Type_ID/layouts \
 		     --header "accept: application/json" \
		     --header "authorization: Bearer $TOKEN" \
		     --header "content-type: application/json" \
		     --data '
		     {
		      "instanceTypeLayout": {
    			"creatable": true,
		        "hasAutoScale": false,
		        "supportsConvertToManaged": false,
		        "containerTypes": [
		         '$Container_Type_ID'
		        ],
		        "name": "HPE CentOS 7.9",
		        "instanceVersion": "7.9",
		        "provisionTypeCode": "vmware"
 		        }
		     }
	             '
		;;
           "Ubuntu 20.04")
                curl -k --request POST \
                     --url https://$MORPHEUS_URL/api/library/instance-types/$Instance_Type_ID/layouts \
                     --header "accept: application/json" \
                     --header "authorization: Bearer $TOKEN" \
                     --header "content-type: application/json" \
                     --data '
                     {
                      "instanceTypeLayout": {
                        "creatable": true,
                        "hasAutoScale": false,
                        "supportsConvertToManaged": false,
                        "containerTypes": [
                         '$Container_Type_ID'
                        ],
                        "name": "HPE Ubuntu 20.04",
                        "instanceVersion": "20.04",
                        "provisionTypeCode": "vmware"
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
