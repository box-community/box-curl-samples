curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/blueprintTemplate/schema" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json-patch+json" \
     -d '[
       {
         "op": "editField",
         "fieldKey": "category",
         "data": {
           "displayName": "Customer Group"
         }
       }
     ]'

