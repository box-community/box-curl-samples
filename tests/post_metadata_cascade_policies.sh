curl -i -X POST "https://api.box.com/2.0/metadata_cascade_policies" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "folder_id": "12321",
       "scope": "enterprise_27335",
       "templateKey": "productInfo"
     }'

