curl -i -X POST "https://api.box.com/2.0/tasks" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "item": {
         "id": "11446498",
         "type": "file"
       },
       "action": "review"
     }'

