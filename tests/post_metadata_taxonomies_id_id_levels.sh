curl -i -X POST "https://api.box.com/2.0/metadata_taxonomies/enterprise_123456/geography/levels" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '[
       {
         "displayName": "Continent",
         "description": "Continent Level"
       },
       {
         "displayName": "Country",
         "description": "Country Level"
       }
     ]'

