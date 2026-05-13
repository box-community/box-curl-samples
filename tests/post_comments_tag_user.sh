curl -i -X POST "https://api.box.com/2.0/comments" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "tagged_message": "What do you think @[1234:John]?",
       "item": {
         "type": "file",
         "id": 123
       }
     }

