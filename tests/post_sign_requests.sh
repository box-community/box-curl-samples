curl -i -X POST "https://api.box.com/2.0/sign_requests" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -d '{
       "signers": [
          {
            "role": "signer",
            "email": "example_email@box.com"
          }
        ],
       "source_files": [
          {
            "type": "file",
            "id": "123456789"
          }
       ],
       "parent_folder":
          {
            "type": "folder",
            "id": "0987654321"
          }
     }'

