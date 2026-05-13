curl -i -X POST "https://api.box.com/2.0/users/terminate_sessions" \
    -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
    -H "content-type: application/json" \
    -H "accept: application/json" \
    -d '{
      "user_ids": ["6178859178", "4824866571"],
      "user_logins": ["user@example.com", "user2@example.com"]
    }'

