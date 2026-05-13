curl -i -L -X POST "https://api.box.com/2.0/ai/text_gen" \
     -H "content-type: application/json" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
          "prompt": "Write a social media post about protein powder.",
          "items": [
         {
            "id": "12345678",
            "type": "file",
            "content": "More information about protein powders"
        },
        ],
          "dialogue_history": [
            {
                "prompt": "Can you add some more information?",
                "answer": "Public API schemas provide necessary information to integrate with APIs...",
                "created_at": "2013-12-12T11:20:43-08:00"
            }
        ],
          "ai_agent": {
            "type": "ai_agent_text_gen",
            "basic_gen": {
              "model": "azure__openai__gpt_4o_mini"
            }
         }
     }'

