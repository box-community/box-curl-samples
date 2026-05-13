curl -i -X POST "https://api.box.com/2.0/folder_locks" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "folder": {
         "type": "folder",
         "id": "33552487093"
       },
       "locked_operations": {
         "move": true,
         "delete": true
       }
     }'

