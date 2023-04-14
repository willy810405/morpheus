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
     		     --url https://$MORPHEUS_URL/api/library/instance-types \
                     --header "accept: application/json" \
                     --header "authorization: Bearer $TOKEN" \
                     --header "content-type: application/json" \
                     --data '
		    {
  		      "instanceType": {
    	                "visibility": "public",
    			"name": "HPE Customer CentOS",
    			"code": "HPECustomerCentOS",
    			"category": "os",
    			"featured": false
  			}
		    }
		    '
		;;
           "Ubuntu 20.04")
                curl -k --request POST \
                     --url https://$MORPHEUS_URL/api/library/instance-types \
                     --header "accept: application/json" \
                     --header "authorization: Bearer $TOKEN" \
                     --header "content-type: application/json" \
                     --data '
                    {
                      "instanceType": {
                        "visibility": "public",
                        "name": "HPE Customer Ubuntu",
                        "code": "HPECustomerUbuntu",
                        "category": "os",
                        "featured": false
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
