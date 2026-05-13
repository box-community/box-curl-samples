curl -i -X POST "https://api.box.com/2.0/storage_policy_assignments" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "storage_policy": {
         "type": "storage_policy",
         "id": "1434325"
       },
       "assigned_to": {
         "type": "user",
         "id": "9987987"
       }
     }'

