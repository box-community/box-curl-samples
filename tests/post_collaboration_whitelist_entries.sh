curl -i -X POST "https://api.box.com/2.0/collaboration_whitelist_entries" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "domain": "example.com",
       "direction": "inboud"
     }'

