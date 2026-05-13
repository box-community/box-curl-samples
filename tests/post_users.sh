curl -i -X POST "https://api.box.com/2.0/users" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "login": "ceo@example.com",
       "name": "Aaron Levie"
     }'

