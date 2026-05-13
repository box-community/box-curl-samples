curl -i -X POST "https://upload.box.com/api/2.0/files/upload_sessions" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "folder_id": "0",
       "file_size": 104857600,
       "file_name": "Contract.pdf"
     }'

