curl -i -X POST "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "audience": "internal",
       "documentType": "Q1 plans",
       "competitiveDocument": "no",
       "status": "active",
       "author": "Jones",
       "currentState": "proposal"
     }'

