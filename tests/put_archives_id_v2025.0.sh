curl -i -X PUT "https://api.box.com/2.0/archives/12345" \
     -H "box-version: 2025.0" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "name": "Some Archive Name",
       "description": "Some Archive Description"
     }'

