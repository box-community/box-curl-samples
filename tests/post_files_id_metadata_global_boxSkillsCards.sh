curl -i -X POST "https://api.box.com/2.0/files//metadata/global/boxSkillsCards" \
     -H "authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH" \
     -H "content-type: application/json" \
     -d '{
       "cards": [{
         "type": "skill_card",
         "skill_card_type": "keyword",
         "skill_card_title": {
           "code": "license-plates",
           "message": "Licence Plates"
         },
         "skill": {
           "type": "service"
           "id": "license-plates-service"
         },
         "invocation": {
           "type": "skill_invocation"
           "id": "license-plates-service-123"
         },
         "entries": {
           { "text": "DD-26-YT" },
           { "text": "DN86 BOX" }
         }
       },{
         "type": "skill_card",
         "skill_card_type": "transcript",
         "skill_card_title": {
           "code": "video-transcription",
           "message": "Video Transcription"
         },
         "skill": {
           "type": "service"
           "id": "video-transcription-service"
         },
         "invocation": {
           "type": "skill_invocation"
           "id": "video-transcription-service-123"
         },
         "duration": 1000,
         "entries": {
           {
             "text": "Hi John, have I told you about Box recently?",
             "appears": [{ "start": 0 }]
           },
           {
             "text": "No Aaron, you have not. Tell me more!",
             "appears": [{ "start": 5 }]
           }
         }
       },{
         "type": "skill_card",
         "skill_card_type": "timeline",
         "skill_card_title": {
           "code": "face-detection",
           "message": "Faces"
         },
         "skill": {
           "type": "service"
           "id": "face-detection-service"
         },
         "invocation": {
           "type": "skill_invocation"
           "id": "face-detection-service-123"
         },
         "duration": 1000,
         "entries": {
           {
             "text": "John",
             "appears": [{ "start": 0, "end": 5 }, { "start": 10, "end": 15 }],
             "image_url": "https://example.com/john.png"
           },
           {
             "text": "Aaron",
             "appears": [{ "start": 5, "end": 10 }],
             "image_url": "https://example.com/aaron.png"
           }
         }
       },{
         "type": "skill_card",
         "skill_card_type": "status",
         "skill_card_title": {
           "code": "hold",
           "message": "Please hold..."
         },
         "skill": {
           "type": "service"
           "id": "face-detection-service"
         },
         "invocation": {
           "type": "skill_invocation"
           "id": "face-detection-service-123"
         },
         "status": {
           "code": "processing",
           "message": "We are processing this file right now."
         }
       }],
     }'

