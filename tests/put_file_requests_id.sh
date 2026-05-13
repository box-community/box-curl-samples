curl -i -X PUT "https://api.box.com/2.0/file_requests/42037322" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
       "title": "Please upload required documents",
       "description": "Please upload required documents",
       "status": "active",
       "is_email_required": true,
       "is_description_required": false
     }'

