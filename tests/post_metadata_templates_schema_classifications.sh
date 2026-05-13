curl -i -X POST "https://api.box.com/2.0/metadata_templates/schema" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "templateKey": "securityClassification-6VMVochwUWo",
       "scope": "enterprise",
       "displayName": "Classification",
       "hidden": false,
       "copyInstanceOnItemCopy": true,
       "fields": [
         {
           "type": "enum",
           "key": "Box__Security__Classification__Key",
           "displayName": "Classification",
           "hidden": false,
           "options": [
             {
               "key": "Classified",
               "staticConfig": {
                 "classification": {
                   "colorID": 7,
                   "classificationDefinition": "Top Seret"
                 }
               }
             }
           ]
         }
       ]
     }'

