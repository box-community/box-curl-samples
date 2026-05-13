curl -i -X POST "https://api.box.com/2.0/terms_of_services" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "status": "enabled",
       "text": "By collaborating on this file you are accepting..."
     }'

