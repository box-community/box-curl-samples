curl -i -X POST "https://api.box.com/2.0/metadata_queries/execute_read" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "from": "enterprise_123456.contractTemplate",
       "query": "amount >= :value",
       "query_params": {
         "value": 100
       },
       "fields": [
         "created_at",
         "metadata.enterprise_123456.contractTemplate.amount",
         "metadata.enterprise_123456.contractTemplate.customerName"
       ],
       "ancestor_folder_id": "5555",
       "order_by": [
         {
           "field_key": "amount",
           "direction": "asc"
         }
       ],
       "limit": 100
     }'

