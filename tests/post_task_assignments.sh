curl -i -X POST "https://api.box.com/2.0/task_assignments" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "task": {
         "id": "11446498",
         "type": "task"
       },
       "assign_to": {
         "id": "4823213"
       }
     }'

