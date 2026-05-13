curl -L 'https://api.box.com/2.0/docgen_batches' \
     -H 'box-version: 2025.0' \
     -H 'Authorization: Bearer TuW6URx9PYvrj8SRGq8nsrnf75ECSRKH' \
     -d '{
        "file": {
            "id": "12345678",
            "type": "file"
        },
        "input_source": "api",
        "destination_folder": {
            "id": "12345678",
            "type": "folder"
        },
        "output_type": "docx",
        "document_generation_data": [
            {
                "generated_file_name": "Image test",
                "user_input": {
                    "order": {
                        "id": "12305",
                        "date": "18-08-2023",
                        "country": "US",
                        "expiryDate": "18-08-2024",
                        "currency": "$",
                        "amount": 5060.5,
                        "taxRate": 10,
                        "requester": "John",
                        "approver": "Smith",
                        "department": "Procurement",
                        "paymentTerms": "30 days",
                        "deliveryTerms": "30 days",
                        "deliveryDate": "18-09-2023",
                        "vendor": {
                            "company": "Example company",
                            "address": {
                                "street": "Example street",
                                "city": "Example city",
                                "zip": "EX-456"
                            }
                        },
                        "products": [
                            {
                                "id": 1,
                                "name": "A4 Papers",
                                "type": "non-fragile",
                                "quantity": 100,
                                "price": 29,
                                "amount": 2900
                            },
                            {
                                "id": 2,
                                "name": "Ink  Cartridge",
                                "type": "non-fragile",
                                "quantity": 40,
                                "price": 39,
                                "amount": 1560
                            },
                            {
                                "id": 3,
                                "name": "Adhesive tape",
                                "type": "non-fragile",
                                "quantity": 20,
                                "price": 30,
                                "amount": 600.5
                            }
                        ]
                    }
                }
            }
        ]
    }'

