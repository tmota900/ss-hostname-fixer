#!/bin/bash

# validate mandatory env variables
if [ -z "$HOST_NAME" ]; then
    echo "HOST_NAME env variable is not set"
    exit 1
fi

if [ -z "$ZONE_ID" ]; then
    echo "ZONE_ID env variable is not set"
    exit 1
fi

if [ -z "$RECORD_ID" ]; then
    echo "RECORD_ID env variable is not set"
    exit 1
fi

if [ -z "$API_TOKEN" ]; then
    echo "API_TOKEN env variable is not set"
    exit 1
fi

SELF_PUBLIC_IP=$(curl -s 'https://api.ipify.org?format=json' | grep -o '[0-9\.]\+');
curl -X PUT "https://api.cloudflare.com/client/v4/zones/${ZONE_ID}/dns_records/${RECORD_ID}" \
-H "Authorization: Bearer ${API_TOKEN}" \
-H "Content-Type: application/json" \
--data "{\"type\":\"A\",\"name\":\"${HOST_NAME}\",\"content\":\"${SELF_PUBLIC_IP}\",\"ttl\":3600,\"proxied\":true}";