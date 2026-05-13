curl -L -X POST "https://api.box.com/2.0/integration_mappings/slack" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H 'content-type: application/json' \
     -d '{
          "partner_item": {
              "id": "C987654321",
              "type": "channel",
              "slack_workspace_id": "T5555555"
          },
          "box_item": {
              "id": "123456789",
              "type": "folder"
          }
      }'

