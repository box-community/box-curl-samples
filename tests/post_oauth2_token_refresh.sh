curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "content-type: application/x-www-form-urlencoded" \
     -d "client_id=" \
     -d "client_secret=" \
     -d "refresh_token=[REFRESH_TOKEN]" \
     -d "grant_type=refresh_token"

