curl -i -X PUT "https://api.box.com/2.0/users/12345/folders/0" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "owned_by": {
         "id": "1232234"
       }
     }'

