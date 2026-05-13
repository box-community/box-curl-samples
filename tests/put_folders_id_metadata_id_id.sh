curl -i -X PUT "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json-patch+json" \
     -d '[
        {
          "op": "test",
          "path": "/competitiveDocument",
          "value": "no"
        },
        {
          "op": "remove",
          "path": "/competitiveDocument"
        },
        {
          "op": "test",
          "path": "/status",
          "value": "active"
        },
        {
          "op": "replace",
          "path": "/status",
          "value": "inactive"
        },
        {
          "op": "test",
          "path": "/author",
          "value": "Jones"
        },
        {
          "op": "copy",
          "from": "/author",
          "path": "/editor"
        },
        {
          "op": "test",
          "path": "/currentState",
          "value": "proposal"
        },
        {
          "op": "move",
          "from": "/currentState",
          "path": "/previousState"
        },
        {
          "op": "add",
          "path": "/currentState",
          "value": "reviewed"
        }
      ]'

