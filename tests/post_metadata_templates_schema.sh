curl -i -X POST "https://api.box.com/2.0/metadata_templates/schema" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
      "scope": "enterprise",
      "displayName": "Customer",
      "fields": [
        {
          "type": "string",
          "key": "name",
          "displayName": "Name",
          "description": "The customer name",
          "hidden": false
        },
        {
          "type": "date",
          "key": "last_contacted_at",
          "displayName": "Last Contacted At",
          "description": "When this customer was last contacted at",
          "hidden": false
        },
        {
          "type": "enum",
          "key": "industry",
          "displayName": "Industry",
          "options": [
            {"key": "Technology"},
            {"key": "Healthcare"},
            {"key": "Legal"}
          ]
        },
        {
          "type": "multiSelect",
          "key": "role",
          "displayName": "Contact Role",
          "options": [
            {"key": "Developer"},
            {"key": "Business Owner"},
            {"key": "Marketing"},
            {"key": "Legal"},
            {"key": "Sales"}
          ]
        }
      ]
    }'

