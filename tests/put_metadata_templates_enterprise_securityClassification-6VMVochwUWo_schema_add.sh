curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json-patch+json" \
     -d '[{
       "op": "addEnumOption",
       "fieldKey": "Box__Security__Classification__Key",
       "data": {
         "key": "Sensitive",
         "staticConfig":{
          "classification": {
            "classificationDefinition": "Sensitive information that must not be shared.",
            "colorID": 4
            }
         }
       }
     }]'

