curl -i -X PUT "https://api.box.com/2.0/task_assignments/12345" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "message": "New message",
       "resolution_state": "completed"
     }'

