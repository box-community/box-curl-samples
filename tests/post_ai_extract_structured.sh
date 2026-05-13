curl -i -L 'https://api.box.com/2.0/ai/extract_structured' \
     -H 'content-type: application/json' \
     -H 'authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH' \
     -d '{
        "items": [
          {
            "id": "12345678",
            "type": "file",
            "content": "This is file content."
          }
        ],
        "metadata_template": {
            "template_key": "",
            "type": "metadata_template",
            "scope": ""
        },
        "fields": [
            {
              "key": "name",
              "description": "The name of the person.",
              "displayName": "Name",
              "prompt": "The name is the first and last name from the email address.",
              "type": "string",
              "options": [
                {
                  "key": "First Name"
                },
                {
                  "key": "Last Name"
                }
              ]
            }
        ],
        "ai_agent": {
          "type": "ai_agent_extract_structured",
          "long_text": {
            "model": "azure__openai__gpt_4o_mini"
            },
          "basic_text": {
            "model": "azure__openai__gpt_4o_mini"
         }
      }
   }'

