#!/bin/bash

export URL=afb46156382e24987ae1c4890578104f-977961780.us-east-2.elb.amazonaws.com

curl --request GET http://${URL}/

export TOKEN=`curl --data '{"email":"abc@xyz.com","password":"mypwd"}' --header "Content-Type: application/json" -X POST http://${URL}/auth  | jq -r '.token'`

echo $TOKEN

curl --request GET http://${URL}/contents -H "Authorization: Bearer ${TOKEN}" | jq .
