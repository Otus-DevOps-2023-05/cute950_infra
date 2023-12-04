#!/bin/bash

master=`terraform -chdir=../terraform output -json | jq '.external_ip_address_app.value[0][0]'`
worker=`terraform -chdir=../terraform output -json | jq '.external_ip_address_app.value[0][1]'`
echo "{
    \"_meta\": {
        \"hostvars\": {
            \"master\": {
                \"ansible_host\" : $master
            },
           \"worker1\": {
                \"ansible_host\" : $worker
            }
        }
    },
    \"all\": {
        \"children\": [\"masters\", \"workers\"]},
        \"masters\": {\"hosts\": [\"master\"]},
        \"workers\": {\"hosts\": [\"worker1\"]}
}
"
