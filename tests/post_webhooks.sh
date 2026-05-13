curl -i -X POST "https://api.box.com/2.0/webhooks" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "target": {
         "id": "21322",
         "type": "file"
       },
       "address": "https://example.com/webhooks",
       "triggers": [
         "FILE.PREVIEWED"
       ]
     }'

