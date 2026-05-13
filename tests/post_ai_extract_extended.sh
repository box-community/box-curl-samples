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
            "system_message": "You are a helpful travel assistant specialized in budget travel",
            "prompt_template": "It is `{current_date}`, and I have $8000 and want to spend a week in the Azores. What should I see?",
            "num_tokens_for_completion": 8400,
            "llm_endpoint_params": {
              "type": "openai_params",
              "temperature": 0,
              "top_p": 1,
              "frequency_penalty": 1.5,
              "presence_penalty": 1.5,
              "stop": "<|im_end|>"
            },
            "embeddings": {
              "model": "openai__text_embedding_ada_002",
              "strategy": {
                "id": "basic",
                "num_tokens_per_chunk": 64
              }
            }
          },
          "basic_text": {
            "model": "azure__openai__gpt_4o_mini",
            "system_message": "You are a helpful travel assistant specialized in budget travel",
            "prompt_template": "It is `{current_date}`, and I have $8000 and want to spend a week in the Azores. What should I see?",
            "num_tokens_for_completion": 8400,
            "llm_endpoint_params": {
              "type": "openai_params",
              "temperature": 0,
              "top_p": 1,
              "frequency_penalty": 1.5,
              "presence_penalty": 1.5,
              "stop": "<|im_end|>"
            }
          }
        }
      }'

