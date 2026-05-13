curl -i -X PUT "https://api.box.com/2.0/retention_policies/982312" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "disposition_action": "permanently_delete"
     }'

