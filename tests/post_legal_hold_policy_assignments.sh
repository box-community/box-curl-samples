curl -i -X POST "https://api.box.com/2.0/legal_hold_policy_assignments" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "policy_id": "123244",
       "assign_to": {
         "type": "folder",
         "id": "6564564"
       }
     }'

