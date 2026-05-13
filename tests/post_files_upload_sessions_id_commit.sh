curl -i -X POST "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD/commit" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "digest: sha=fpRyg5eVQletdZqEKaFlqwBXJzM=" \
     -H "content-type: application/json" \
     -d '{
       "parts": [
         {
           "part_id": "BFDF5379",
           "offset": 0,
           "size": 8388608,
	     "sha1": "134b65991ed521fcfe4724b7d814ab8ded5185dc"
         },
		     {
           "part_id": "E8A3ED8E",
           "offset": 8388608,
           "size": 1611392,
	     "sha1": "234b65934ed521fcfe3424b7d814ab8ded5185dc"
         }
       ],
       "attributes": {
         "content_modified_at": "2017-04-08T00:58:08Z"
       }
     }'

