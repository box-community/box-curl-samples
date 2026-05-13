curl -i -X POST "https://api.box.com/2.0/workflows/42037322/start" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
       "type": "workflow_parameters",
       "flow": {
        "id": "8937625",
        "type": "flow"
       },
       "files": [{
          "type": "file",
          "id": "389047572"
        },
        {
          "type": "file",
          "id": "389047578"
        }],
       "folder": {
         "id": "2233212",
         "type": "folder"
       },
       "outcomes": [
          {
            "id": "34895783",
            "type": "outcome",
            "task_collaborators": {
                "type": "variable",
                "variable_type": "user_list",
                "variable_value": [{ "type": "user", "id": "890273642" }]
            },
            "completion_rule": {
                "type": "variable",
                "variable_type": "task_completion_rule",
                "variable_value": "all_assignees"
            },
            "file_collaborator_role": {
                "type": "variable",
                "variable_type": "collaborator_role",
                "variable_value": "viewer"
            }
          }
        ]
     }'

