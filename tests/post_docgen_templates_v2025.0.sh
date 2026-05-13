curl -L 'https://api.box.com/2.0/docgen_templates' \
     -H 'box-version: 2025.0' \
     -H 'Authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH' \
     -H 'Content-Type: application/json' \
     -d '{
        "file": {
            "id": "12345678",
            "type": "file"
        }
}'

