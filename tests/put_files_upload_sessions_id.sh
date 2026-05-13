curl -i -X PUT "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "digest: sha=fpRyg5eVQletdZqEKaFlqwBXJzM=" \
     -H "content-range: bytes 8388608-16777215/445856194" \
     -H "content-type: application/octet-stream" \
     --data-binary @<FILE_NAME>

