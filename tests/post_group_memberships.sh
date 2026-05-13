curl -i -X POST "https://api.box.com/2.0/group_memberships" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "user": {
         "id": "1434325"
       },
       "group": {
         "id": "4545523"
       }
     }'

