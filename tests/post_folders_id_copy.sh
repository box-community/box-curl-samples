curl -i -X POST "https://api.box.com/2.0/folders/4353455/copy" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "parent": {
         "id": "345345"
       }
     }'

