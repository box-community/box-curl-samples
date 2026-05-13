curl -i -X PUT "https://api.box.com/2.0/terms_of_services/324234" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "status": "enabled",
       "text": "By collaborating on this file you are accepting..."
     }'

