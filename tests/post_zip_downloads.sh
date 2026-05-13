curl -i -X POST "https://api.box.com/2.0/zip_downloads" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
       "download_file_name": "January Financials",
       "items": [
         {
           "type": "file",
           "id": "12345"
         },
         {
           "type": "file",
           "id": "34325"
         },
         {
           "type": "folder",
           "id": "45678"
         }
       ]
     }'

