curl -i -X POST "https://api.box.com/2.0/web_links" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "name": "Cloud Content Management",
       "url": "https://box.com",
       "parent": {
         "id": "0"
       }
     }'

