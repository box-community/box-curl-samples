curl -i -L 'https://api.box.com/2.0/ai/extract' \
     -H 'content-type: application/json' \
     -H 'authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH' \
     -d '{
        "prompt": "Extract data related to contract conditions",
        "items": [
              {
                  "type": "file",
                  "id": "1497741268097"
              }
        ],
        "ai_agent": {
          "type": "ai_agent_extract",
          "long_text": {
            "model": "azure__openai__gpt_4o_mini",
            "prompt_template": "It is `{current_date}`, and I have $8000 and want to spend a week in the Azores. What should I see?",
          },
          "basic_text": {
            "model": "azure__openai__gpt_4o_mini",
          }
        }
      }'

