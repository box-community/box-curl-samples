curl -i -X PUT "https://api.box.com/2.0/folders/" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "collections": [
          {
            "id": "123"
          }
       ]
     }'

