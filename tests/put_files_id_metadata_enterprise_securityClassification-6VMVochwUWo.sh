curl -i -X PUT "https://api.box.com/2.0/files//metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json-patch+json" \
     -d '[{
       "op": "replace",
       "path": "/Box__Security__Classification__Key",
       "value": "Internal"
     }]'

