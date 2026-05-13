curl -i -X PUT "https://api.box.com/2.0/web_links/32423234?fields=shared_link" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
       "shared_link": {
         "access": "open",
         "password": "mypassword",
         "unshared_at": "2012-12-12T10:53:43-08:00",
         "permissions": {
           "can_download": false
         }
       }
     }'

