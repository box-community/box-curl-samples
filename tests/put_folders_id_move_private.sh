curl -i -X PUT "https://api.box.com/2.0/folders/4353455" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "name": "New folder name",
       "parent": {
         "id": "123"
       },
        "owned_by": {
         "id": "123456"
       }
     }'

