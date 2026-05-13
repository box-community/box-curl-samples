curl -i -X POST "https://api.box.com/2.0/invites" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "enterprise": {
         "id": "1232234"
       },
       "actionable_by": {
         "login" : "freeuser@box.com"
       }
     }'

