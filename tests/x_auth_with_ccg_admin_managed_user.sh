curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "content-type: application/x-www-form-urlencoded" \
     -d "client_id=" \
     -d "client_secret=" \
     -d "grant_type=client_credentials" \
     -d "box_subject_type=user"  \
     -d "box_subject_id=[USER_ID]"

