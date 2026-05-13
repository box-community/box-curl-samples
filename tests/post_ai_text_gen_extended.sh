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
                "prompt": "Make my email about public APIs sound more professional",
                "answer": "Here is the first draft of your professional email about public APIs",
                "created_at": "2013-12-12T10:53:43-08:00"
            },
            {
                "prompt": "Can you add some more information?",
                "answer": "Public API schemas provide necessary information to integrate with APIs...",
                "created_at": "2013-12-12T11:20:43-08:00"
            }
        ],
          "ai_agent": {
            "type": "ai_agent_text_gen",
            "basic_gen": {
              "model": "azure__openai__gpt_4o_mini",
              "system_message": "You are a helpful travel assistant specialized in budget travel",
              "prompt_template": "It is `{current_date}`, and I have $8000 and want to spend a week in Azores. What should I see?",
              "num_tokens_for_completion": 8400,
              "llm_endpoint_params": {
                "type": "openai_params",
                "temperature": 2.0,
                "top_p": 1.0,
                "frequency_penalty": 1.5,
                "presence_penalty": 1.5,
                "stop": "<|im_end|>"
              },
              "embeddings": {
                "model": " openai__text_embedding_ada_002",
                "strategy": {
                  "id": "basic",
                  "num_tokens_per_chunk": 64
                }
              },
              "content_template": "---{content}---"
           }
        }
     }'

