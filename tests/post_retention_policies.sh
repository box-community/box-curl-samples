curl -i -X POST "https://api.box.com/2.0/retention_policies" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "policy_name": "Some Policy Name",
       "policy_type": "finite",
       "retention_length": 365,
       "disposition_action": "permanently_delete"
     }'

