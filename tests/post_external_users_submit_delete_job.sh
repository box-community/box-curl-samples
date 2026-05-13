curl -L -X POST "https://api.box.com/2.0/external_users/external_users_submit_delete_job" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
      "external_users":
        "type": "array"
        "description": "List of external users to delete."
        "items":
          "$ref: #/components/schemas/UserReference"
      }'

