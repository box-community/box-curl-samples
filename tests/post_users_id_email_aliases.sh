curl -i -X POST "https://api.box.com/2.0/users/12345/email_aliases" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "email": "alias@example.com"
     }'

