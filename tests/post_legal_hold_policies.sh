curl -i -X POST "https://api.box.com/2.0/legal_hold_policies" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "policy_name": "Policy 3",
       "description": "Automatic created policy"
     }'

