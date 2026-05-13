curl -i -X POST "https://api.box.com/2.0/terms_of_service_user_statuses" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "tos": {
         "type": "terms_of_service",
         "id": "1232132"
       },
       "user": {
         "type": "user",
         "id": "3423423"
       },
       "is_accepted": true
     }'

