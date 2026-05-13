curl -i -X PUT "https://api.box.com/2.0/webhooks/3321123" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "triggers": [
         "FILE.DOWNLOADED"
       ]
     }'

