curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "content-type: application/x-www-form-urlencoded" \
     -d "subject_token=TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d "subject_token_type=urn:ietf:params:oauth:token-type:access_token" \
     -d "scope=item_upload item_preview base_explorer" \
     -d "resource=https://api.box.com/2.0/folders/6" \
     -d "grant_type=urn:ietf:params:oauth:grant-type:token-exchange"

