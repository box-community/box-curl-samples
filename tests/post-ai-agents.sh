curl -L -X POST "https://api.box.com/2.0/ai-agents" \
      -H 'Authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH' \
      -d '{
        type:
      type: string
      description: The type of agent used to handle queries.
      enum:
        - ai_agent
      example: ai_agent
      name:
        type: string
        description: The name of the AI Agent.
        example: 'My AI Agent'
      access_state:
        $ref: ../schemas/ai_agent_access_state.yml
      icon_reference:
        type: string
        minLength: 1
        description: |-
          The icon reference of the AI Agent. It should have format of the URL https://cdn01.boxcdn.net/app-assets/aistudio/avatars/<file_name> 
          where possible values of file_name are: `logo_boxAi.png`,`logo_stamp.png`,`logo_legal.png`,`logo_finance.png`,`logo_config.png`,`logo_handshake.png`,`logo_analytics.png`,`logo_classification.png
        example: 'https://cdn01.boxcdn.net/app-assets/aistudio/avatars/logo_analytics.svg'
      allowed_entities:
        type: array
        },
      - d '{
        items:
        $ref: '#/components/schemas/AiAgentAllowedEntity'
      description: List of allowed users or groups.
      ask:
        $ref: '#/components/schemas/AiStudioAgentAsk'
      text_gen:
        $ref: '#/components/schemas/AiStudioAgentTextGen'
      extract:
        $ref: '#/components/schemas/AiStudioAgentExtract'
      }

