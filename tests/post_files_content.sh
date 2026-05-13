curl -i -X POST "https://upload.box.com/api/2.0/files/content" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: multipart/form-data" \
     -F attributes='{"name":"Contract.pdf", "parent":{"id":"11446498"}}' \
     -F file=@<FILE_NAME>

