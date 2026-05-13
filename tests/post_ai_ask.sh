curl -i -L -X POST "https://api.box.com/2.0/ai/ask" \
     -H "content-type: application/json" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
         "mode": "single_item_qa",
         "prompt": "What is the value provided by public APIs based on this document?",
         "items": [
            {
            "type": "file",
            "id": "9842787262"
            }
         ],
         "dialogue_history": [
              {
              "prompt": "Make my email about public APIs sound more professional",
              "answer": "Here is the first draft of your professional email about public APIs",
              "created_at": "2013-12-12T10:53:43-08:00"
              }
          ],
          "include_citations": true,
          "ai_agent": {
            "type": "ai_agent_ask",
            "long_text": {
              "model": "azure__openai__gpt_4o_mini",
              "prompt_template": "It is `{current_date}`, and I have $8000 and want to spend a week in the Azores. What should I see?",
            },
            "basic_text": {
              "model": "azure__openai__gpt_4o_mini",
           }
         }
      }'

