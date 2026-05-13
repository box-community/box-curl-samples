curl -i -X POST "https://api.box.com/2.0/metadata_taxonomies" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "displayName": "Geography",
       "key": "geography",
       "namespace": "enterprise_123456"
     }'

