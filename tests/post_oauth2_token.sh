curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "content-type: application/x-www-form-urlencoded" \
     -d "client_id=" \
     -d "client_secret=" \
     -d "code=[CODE]" \
     -d "grant_type=authorization_code"

