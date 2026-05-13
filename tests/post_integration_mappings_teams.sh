curl -L -X POST "https://api.box.com/2.0/integration_mappings/teams" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H 'content-type: application/json' \
     -d '{
          "partner_item": {
              "id": "19%3ABCD-Avgfggkggyftdtfgghjhkhkhh%40thread:tacv2",
              "type": "channel",
              "team_id": "hjgjgjg-bhhj-564a-b643-hghgj685u",
              "tenant_id": "E1234567"
          },
          "box_item": {
              "id": "42037322",
              "type": "folder"
          }
      }'

