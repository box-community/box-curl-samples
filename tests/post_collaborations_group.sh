curl -i -X POST "https://api.box.com/2.0/collaborations" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "item": {
         "type": "file",
         "id": "11446498"
       },
       "accessible_by": {
         "type": "group",
         "id": "845344"
       },
       "role": "editor"
     }'

