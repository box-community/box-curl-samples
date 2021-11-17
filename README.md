# Box cURL samples

## Authorize a user

Authorize a user by sending them through the [Box](https://box.com)
website and request their permission to act on their behalf.

This is the first step when authenticating a user using
OAuth 2.0. To request a user's authorization to use the Box APIs
on their behalf you will need to send a user to the URL with this
format.

<!-- sample get_authorize -->
```bash
curl -i -X GET "https://account.box.com/api/oauth2/authorize?response_type=code&client_id=ly1nj6n11vionaie65emwzk575hnnmrk&redirect_uri=http://example.com/auth/callback"
```

## Request an access token

Request an Access Token using either a client-side obtained OAuth2
authorization code or a server-side JWT assertion.

An Access Token is a string that enables Box to verify that a
request belongs to an authorized session. In the normal order of
operations you will begin by requesting authentication from the
[authorize](#get-authorize) endpoint and Box will send you an
authorization code.

You will then send this code to this endpoint to exchange it for
an Access Token. The returned Access Token can then be used to to make
Box API calls.

<!-- sample post_oauth2_token -->
```bash
curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "client_id=[CLIENT_ID]" \
     -d "client_secret=[CLIENT_SECRET]" \
     -d "code=[CODE]" \
     -d "grant_type=authorization_code"
```

## Refresh an access token

<!-- sample post_oauth2_token refresh -->
```bash
curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "client_id=[CLIENT_ID]" \
     -d "client_secret=[CLIENT_SECRET]" \
     -d "refresh_token=[REFRESH_TOKEN]" \
     -d "grant_type=refresh_token"
```

## Downscope a token

<!-- sample post_oauth2_token downscope_token -->
```bash
curl -i -X POST "https://api.box.com/oauth2/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "subject_token=[ACCESS_TOKEN]" \
     -d "subject_token_type=urn:ietf:params:oauth:token-type:access_token" \
     -d "scope=item_upload item_preview base_explorer" \
     -d "resource=https://api.box.com/2.0/folders/123456" \
     -d "grant_type=urn:ietf:params:oauth:grant-type:token-exchange"
```


## Revoke an access token

Revoke an active Access Token, effectively logging a user out
that has been previously authenticated.

<!-- sample post_oauth2_revoke -->
```bash
curl -i -X POST "https://api.box.com/oauth2/revoke" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "client_id=[CLIENT_ID]" \
     -d "client_secret=[CLIENT_SECRET]" \
     -d "token=[ACCESS_TOKEN]"
```

## Get a file

Retrieves the details about a file.

<!-- sample get_files_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Restore file

Restores an file that has been moved to the trash.

<!-- sample post_files_id -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
```

## Update a file

Updates a file. This can be used to rename or move a file,
create a shared link, or lock a file.

<!-- sample put_files_id -->
```bash
curl -i -X PUT "https://upload.box.com/api/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "New name"
     }'
```

## Delete a file

Deletes a file, either permanently or by moving it to
the trash.

The the enterprise settings determine whether the item will
be permanently deleted from Box or moved to the trash.

<!-- sample delete_files_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Download a file

Returns the contents of a file in binary format.

<!-- sample get_files_id_content -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -L
```

## Download a file version

<!-- sample get_files_id_content for_version -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/content?version=4" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -L
```

## Get download URL

<!-- sample get_files_id_content get_url -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/content?version=4" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Download a shared link

Returns the contents of a file in binary format.

<!-- sample get_files_id_content for_shared_file -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "BoxApi: shared_link=https://cloud.box.com/shared/static/gjasdasjhasd&shared_link_password=letmein" \
     -L
```

## Upload a file version

Update a file's content. For file sizes over 50MB we recommend
using the Chunk Upload APIs.

<!-- sample post_files_id_content -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/12345/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: multipart/form-data" \
     -F attributes="{"name":"Contract.pdf", "parent":{"id":"11446498"}}" \
     -F file=@<FILE_NAME>
```

## Preflight check

Performs a check to verify that a file will be accepted by Box
before you upload the entire file.

<!-- sample options_files_content -->
```bash
curl -i -X OPTIONS "https://api.box.com/2.0/files/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{"name":"Contract.pdf", "parent":{"id":"11446498"}}'
```

<!-- sample options_files_id_content -->
```bash
curl -i -X OPTIONS "https://api.box.com/2.0/files/12345/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{"name":"Contract.pdf", "parent":{"id":"11446498"}}'
```

## Upload a file

Uploads a small file to Box. For file sizes over 50MB we recommend
using the Chunk Upload APIs.

<!-- sample post_files_content -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/content" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: multipart/form-data" \
     -F attributes="{"name":"Contract.pdf", "parent":{"id":"11446498"}}" \
     -F file=@<FILE_NAME>
```

## Create upload session

Creates an upload session for a new file.

<!-- sample post_files_upload_sessions -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/upload_sessions" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "folder_id": "0",
       "file_size": 104857600,
       "file_name": "Contract.pdf"
     }'
```

## Create upload session for existing file

Creates an upload session for an existing file.

<!-- sample post_files_id_upload_sessions -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/12345/upload_sessions" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "file_size": 104857600
     }'
```

## Get upload session

Return information about an upload session.

<!-- sample get_files_upload_sessions_id -->
```bash
curl -i -X GET "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Upload a part

Updates a chunk of an upload session for a file.

<!-- sample put_files_upload_sessions_id -->
```bash
curl -i -X PUT "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Digest: sha=fpRyg5eVQletdZqEKaFlqwBXJzM=" \
     -H "Content-Range: bytes 8388608-16777215/445856194" \
     -H "Content-Type: application/octet-stream" \
     --data-binary @<FILE_NAME>
```

## Abort upload session

Abort an upload session and discard all data uploaded.

This cannot be reversed.

<!-- sample delete_files_upload_sessions_id -->
```bash
curl -i -X DELETE "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List parts

Return a list of the chunks uploaded to the upload
session so far.

<!-- sample get_files_upload_sessions_id_parts -->
```bash
curl -i -X GET "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD/parts" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Commit upload session

Close an upload session and create a file from the
uploaded chunks.

<!-- sample post_files_upload_sessions_id_commit -->
```bash
curl -i -X POST "https://upload.box.com/api/2.0/files/upload_sessions/F971964745A5CD0C001BBE4E58196BFD/commit" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Digest: sha=fpRyg5eVQletdZqEKaFlqwBXJzM=" \
     -H "Content-Type: application/json" \
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
```

## Copy a file

Creates a copy of a file.

<!-- sample post_files_id_copy -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345/copy" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "parent": {
         "id": "123"
       }
     }'
```

## Get a file thumbnail

Retrieves a thumbnail, or smaller image representation, of a file.

Sizes of `32x32`,`64x64`, `128x128`, and `256x256` can be returned in
the `.png` format and sizes of `32x32`, `94x94`, `160x160`, and `320x320`
can be returned in the `.jpg` format.

Thumbnails can be generated for the image and video file formats listed
[found on our community site](http://community.box.com/t5/Managing-\
Your-Content/What-file-types-are-supported-by-Box-s-Content-Preview/\
ta-p/327).

<!-- sample get_files_id_thumbnail_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/thumbnail.png" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get file collaborations

Retrieves a list of collaborations for a file. This
returns all the users that have access to the file.

<!-- sample get_files_id_collaborations -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/collaborations" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List a file's comments

Retrieves a list of comments for a file.

<!-- sample get_files_id_comments -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/comments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get file tasks

Retrieves a list of all the tasks for a file. This
endpoint does not support paging.

<!-- sample get_files_id_tasks -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/tasks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get trashed file

Retrieves a file that has been moved to the trash.

<!-- sample get_files_id_trash -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Permanently delete file

Permanently deletes a file that is in the trash.
This action cannot be undone.

<!-- sample delete_files_id_trash -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List all file versions

Retrieve information on all version of a file. This endpoint can be used to
retrieve information about older versions of a file.

Versions are only tracked for Box users with premium accounts.

<!-- sample get_files_id_versions -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/versions" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get a file version

Retrieve a specific older version of a file.

Versions are only tracked for Box users with premium accounts.

<!-- sample get_files_id_versions_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/versions/456456" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Delete file version

Move a file version to the trash.

Versions are only tracked for Box users with premium accounts.

<!-- sample delete_files_id_versions_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/versions/456456" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Revert file version

Revert to a previous version of a file.


If previous versions exist, this method can be used to
promote one of the older versions to the top of the version history.

This actually creates a new copy of the old version and puts it at the
top of the versions history. The file will have the exact same contents
as the older version, with the the same SHA1/etag, and the same name
as the original.

Other properties such as comments do not get updated to their
former values.

<!-- sample post_files_id_versions_current -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345/versions/current" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "type": "file_version",
       "id": "456456"
     }'
```

## List file's metadata

Retrieves all metadata for a given file.

<!-- sample get_files_id_metadata -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/metadata" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get specific file metadata

Retrieve a specific metadata template instance for a file

<!-- sample get_files_id_metadata_id_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create metadata on file

Creates a piece of metadata on a file based on the specified template.

Only values that are present in the metadata template
will be accepted.

<!-- sample post_files_id_metadata_id_id -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "audience: "internal",
       "documentType": "Q1 plans",
       "competitiveDocument": "no",
       "status": "active",
       "author": "Jones",
       "currentState": "proposal"
     }'

```

## Update file metadata

Updates a piece of metadata on a file.

The metadata instance can only be updated if the instance
already exists. When editing metadata, only values that adhere to the
metadata template schema will be accepted.

The update is applied atomically. If any errors occur during the
application of the operations, the metadata instance remains unchanged.

<!-- sample put_files_id_metadata_id_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '[
        {
          "op": "test",
          "path": "/competitiveDocument",
          "value": "no"
        },
        {
          "op": "remove",
          "path": "/competitiveDocument"
        },
        {
          "op": "test",
          "path": "/status",
          "value": "active"
        },
        {
          "op": "replace",
          "path": "/status",
          "value": "inactive"
        },
        {
          "op": "test",
          "path": "/author",
          "value": "Jones"
        },
        {
          "op": "copy",
          "from": "/author",
          "path": "/editor"
        },
        {
          "op": "test",
          "path": "/currentState",
          "value": "proposal"
        },
        {
          "op": "move",
          "from": "/currentState",
          "path": "/previousState"
        },
        {
          "op": "add",
          "path": "/currentState",
          "value": "reviewed"
        }
      ]'
```

## Delete file metadata

Deletes a piece of file metadata.

<!-- sample delete_files_id_metadata_id_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get file watermark

Retrieve the watermark for a file.

<!-- sample get_files_id_watermark -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Apply watermark to file

Applies or update a watermark on a file.

<!-- sample put_files_id_watermark -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "watermark": {
         "imprint": "default"
       }
     }'
```

## Remove file watermark

Removes the watermark from a file.

<!-- sample delete_files_id_watermark -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get a folder

Retrieves details for a folder, including the first 100 entries
in the folder.

To fetch more items within the folder, please use the
[Get items in a folder](#get-folders-id-items) endpoint.

<!-- sample get_folders_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Restore folder

Restores a folder that has been moved to the trash.

<!-- sample post_folders_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update a folder

Updates a folder. This can be also be used to move the folder,
create shared links, update collaborations, and more.

<!-- sample put_folders_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "New folder name"
     }'
```

## Move a folder

<!-- sample put_folders_id move -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "New folder name",
       "parent": {
         "id": "123"
       }
     }'
```

## Rename a folder

<!-- sample put_folders_id rename -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "New folder name"
     }'
```

## Change folder owner

<!-- sample put_folders_id transfer -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "owned_by": {
         "id": "123"
       }
     }'
```

## Delete a folder

Deletes a folder, either permanently or by moving it to
the trash.

<!-- sample delete_folders_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folders/4353455" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get items in folder

Retrieves a page of items in a folder. These items can be files,
folders, and web links.

To request more information about the folder itself, like its size,
please use the [Get a folder](#get-folders-id) endpoint instead.

<!-- sample get_folders_id_items -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/0/items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create a folder

Creates a new empty folder within the specified parent folder.

<!-- sample post_folders -->
```bash
curl -i -X POST "https://api.box.com/2.0/folders" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "New Folder",
       "parent": {
         "id": "0"
       }
     }'
```

## Copy a folder

Creates a copy of a folder within a destination folder.

The original folder will not be changed.

<!-- sample post_folders_id_copy -->
```bash
curl -i -X POST "https://api.box.com/2.0/folders/4353455/copy" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "parent": {
         "id": "345345"
       }
     }'
```

## Get folder collaborations

Retrieves a list of collaborations for a folder. This
returns all the users that have access to the folder.

<!-- sample get_folders_id_collaborations -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455/collaborations" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get trashed folder

Retrieves a folder that has been moved to the trash.

<!-- sample get_folders_id_trash -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Permanently delete folder

Permanently deletes a folder that is in the trash.
This action cannot be undone.

<!-- sample delete_folders_id_trash -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folders/4353455/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List folder's metadata

Retrieves all metadata for a given folder.

<!-- sample get_folders_id_metadata -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455/metadata" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get specific folder metadata

Retrieve a specific metadata template instance for a folder

<!-- sample get_folders_id_metadata_id_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create metadata on folder

Creates a piece of metadata on a folder based on the specified template.

Only values that are present in the metadata template
will be accepted.

<!-- sample post_folders_id_metadata_id_id -->
```bash
curl -i -X POST "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "audience: "internal",
       "documentType": "Q1 plans",
       "competitiveDocument": "no",
       "status": "active",
       "author": "Jones",
       "currentState": "proposal"
     }'
```

## Update folder metadata

Updates a piece of metadata on a folder based.

The metadata instance can only be updated if the instance
already exists. When editing metadata, only values that adhere to the
metadata template schema will be accepted.

The update is applied atomically. If any errors occur during the
application of the operations, the metadata instance remains unchanged.

<!-- sample put_folders_id_metadata_id_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '[
        {
          "op": "test",
          "path": "/competitiveDocument",
          "value": "no"
        },
        {
          "op": "remove",
          "path": "/competitiveDocument"
        },
        {
          "op": "test",
          "path": "/status",
          "value": "active"
        },
        {
          "op": "replace",
          "path": "/status",
          "value": "inactive"
        },
        {
          "op": "test",
          "path": "/author",
          "value": "Jones"
        },
        {
          "op": "copy",
          "from": "/author",
          "path": "/editor"
        },
        {
          "op": "test",
          "path": "/currentState",
          "value": "proposal"
        },
        {
          "op": "move",
          "from": "/currentState",
          "path": "/previousState"
        },
        {
          "op": "add",
          "path": "/currentState",
          "value": "reviewed"
        }
      ]'
```

## Delete folder metadata

Deletes a piece of folder metadata.

<!-- sample delete_folders_id_metadata_id_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folders/4353455/metadata/enterprise_27335/blueprintTemplate" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List trashed items

Retrieves the files and folders that have been moved
to the trash.

Any attribute in the full files or folders objects can be passed
in with the `fields` parameter to retrieve those specific
attributes that are not returned by default.

<!-- sample get_folders_trash_items -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/trash/items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get folder watermark

Retrieve the watermark for a folder.

<!-- sample get_folders_id_watermark -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/4353455/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Apply watermark to folder

Applies or update a watermark on a folder.

<!-- sample put_folders_id_watermark -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/4353455/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "watermark": {
         "imprint": "default"
       }
     }'
```

## Remove folder watermark

Removes the watermark from a folder.

<!-- sample delete_folders_id_watermark -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folders/4353455/watermark" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get folder lock

Retrieve locks applied to a folder.

<!-- sample get_folder_locks -->
```bash
curl -i -X GET "https://api.box.com/2.0/folder_locks?folder_id=33552487093" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create folder lock

Creates a lock on a folder to prevent move and / or delete operations.

<!-- sample post_folder_locks -->
```bash
curl -i -X POST "https://api.box.com/2.0/folder_locks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "folder": {
         "type": "folder",
         "id": "33552487093"
       },
       "locked_operations": {
         "move": true,
         "delete": true
       }
     }'
```

## Delete folder lock

Deletes a lock on a folder.

<!-- sample delete_folder_locks_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folder_locks/93134" \ 
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get template by name

Retrieves a metadata template by its scope and template name.

<!-- sample get_metadata_templates_id_id_schema -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_templates/enterprise/blueprintTemplate/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update metadata template

Updates a metadata template.

The metadata template can only be updated if the template
already exists.

The update is applied atomically. If any errors occur during the
application of the operations, the metadata template remains unchanged.

<!-- sample put_metadata_templates_id_id_schema -->
```bash
curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/blueprintTemplate/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '[
       {
         "op": "editField",
         "fieldKey": "category",
         "data": {
           "displayName": "Customer Group"
         }
       }
     ]'
```

## Delete metadata template

Delete a metadata template and its instances.
This deletion is permanent and can not be reversed.

<!-- sample delete_metadata_templates_id_id_schema -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/metadata_templates/enterprise/blueprintTemplate/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get a template by ID

Retrieves a metadata template by its ID.

<!-- sample get_metadata_templates_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_templates/d9671692-3df6-11ea-b77f-2e728ce88125" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List enterprise templates

Used to retrieve all metadata templates within a user's enterprise

<!-- sample get_metadata_templates_enterprise -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_templates/enterprise" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List global templates

Used to retrieve all globally available metadata templates.

<!-- sample get_metadata_templates_global -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_templates/global" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create metadata template

Creates a new metadata template that can be applied to files and folders.

<!-- sample post_metadata_templates_schema -->
```bash
curl -i -X POST "https://api.box.com/2.0/metadata_templates/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
      "scope": "enterprise",
      "displayName": "Customer",
      "fields": [
        {
          "type": "string",
          "key": "name",
          "displayName": "Name",
          "description": "The customer name",
          "hidden": false
        },
        {
          "type": "date",
          "key": "last_contacted_at",
          "displayName": "Last Contacted At",
          "description": "When this customer was last contacted at",
          "hidden": false
        },
        {
          "type": "enum",
          "key": "industry",
          "displayName": "Industry",
          "options": [
            {"key": "Technology"},
            {"key": "Healthcare"},
            {"key": "Legal"}
          ]
        },
        {
          "type": "multiSelect",
          "key": "role",
          "displayName": "Contact Role",
          "options": [
            {"key": "Developer"},
            {"key": "Business Owner"},
            {"key": "Marketing"},
            {"key": "Legal"},
            {"key": "Sales"}
          ]
        }
      ]
    }'
```

## List cascade policies

Retrieve a collection of metadata cascade policies
within a given folder for the current enterprise.

<!-- sample get_metadata_cascade_policies -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_cascade_policies?folder_id=31232" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create cascade policy

Creates a new metadata cascade policy that applies a given
metadata template to a given folder and automatically
cascades it down to its children.

In order for the policy to work, a metadata instance must first
be applied to the folder.

<!-- sample post_metadata_cascade_policies -->
```bash
curl -i -X POST "https://api.box.com/2.0/metadata_cascade_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "folder_id": "12321",
       "scope": "enterprise_27335",
       "templateKey": "productInfo"
     }'
```

## Get cascade policy

Retrieve a metadata cascade policy.

<!-- sample get_metadata_cascade_policies_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_cascade_policies/324324" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Delete cascade policy

Deletes a metadata cascade policy.

<!-- sample delete_metadata_cascade_policies_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/metadata_cascade_policies/324324" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Force apply cascade policy

If a policy already exists on a folder, this will apply that policy
to all existing files and sub-folders within the target folder.

<!-- sample post_metadata_cascade_policies_id_apply -->
```bash
curl -i -X POST "https://api.box.com/2.0/metadata_cascade_policies/21312/apply" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "conflict_resolution": "overwrite"
     }'
```

## Create a metadata query

<!-- sample post_metadata_queries_execute_read -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "from": "enterprise_123456.contractTemplate",
       "query": "amount >= :value",
       "query_params": {
         "value": 100
       },
       "fields": [
         "created_at",
         "metadata.enterprise_123456.contractTemplate.amount",
         "metadata.enterprise_123456.contractTemplate.customerName"
       ],
       "ancestor_folder_id": "5555",
       "order_by": [
         {
           "field_key": "amount",
           "direction": "asc"
         }
       ],
       "limit": 100
     }'
```

## Get metadata query indices

<!-- sample get_metadata_query_indices -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_query_indices?scope=enterprise&template_key=properties" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get comment

Retrieves the message and metadata for a specific comment, as well
as information on the user who created the comment.

<!-- sample get_comments_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/comments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update comment

Update the message of a comment.

<!-- sample put_comments_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/comments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "message": "My New Message"
     }'
```

## Delete comment

Permanently deletes a comment.

<!-- sample delete_comments_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/comments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create comment

Adds a comment comment by the user to a specific file, or
as a reply to an other comment.

<!-- sample post_comments -->
```bash
curl -i -X POST "https://api.box.com/2.0/comments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "message": "Review completed!",
       "item": {
         "type": "file",
         "id": 426436
       }
     }'
```

## Create reply

<!-- sample post_comments as_reply  -->
```bash
curl -i -X POST "https://api.box.com/2.0/comments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "message": "I agree with this.",
       "item": {
         "type": "comment",
         "id": 345344
       }
     }
```

## Tag User in Comment

<!-- sample post_comments tag_user -->
```bash
curl -i -X POST "https://api.box.com/2.0/comments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "tagged_message": "What do you think @[1234:John]?",
       "item": {
         "type": "file",
         "id": 123
       }
     }
```


## Tag User in Reply

<!-- sample post_comments as_reply_tag_user -->
```bash
curl -i -X POST "https://api.box.com/2.0/comments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "message": " @[1234:John], I agree with this.",
       "item": {
         "type": "comment",
         "id": 345344
       }
     }
```

## Get collaboration

Retrieves a single collaboration.

<!-- sample get_collaborations_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaborations/1234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update collaboration

Updates a collaboration.

Can be used to change the owner of an item, or to
accept collaboration invites.

<!-- sample put_collaborations_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/collaborations/1234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "role": "viewer"
     }'
```

## Delete collaboration

Deletes a single collaboration.

<!-- sample delete_collaborations_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/collaborations/1234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List pending collaborations

Retrieves all pending collaboration invites for this user.

<!-- sample get_collaborations -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaborations?status=pending" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create collaboration

Adds a collaboration for a single user or a single group to a file
or folder.

Collaborations can be created using email address, user IDs, or a
group IDs.

If a collaboration is being created with a group, access to
this endpoint is dependent on the group's ability to be invited.

<!-- sample post_collaborations-->
```bash
curl -i -X POST "https://api.box.com/2.0/collaborations" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "item": {
         "type": "file",
         "id": "11446498"
       },
       "accessible_by": {
         "type": "user",
         "login": "user@example.com"
       },
       "role": "editor"
     }'
```

<!-- sample post_collaborations group-->
```bash
curl -i -X POST "https://api.box.com/2.0/collaborations" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "item": {
         "type": "file",
         "id": "11446498"
       },
       "accessible_by": {
         "type": "group",
         "id": "845344"
       },
       "role": "editor"
     }'
```

## Search for content

Searches for items that are available to the user or an entire enterprise.

<!-- sample get_search -->
```bash
curl -i -X GET "https://api.box.com/2.0/search?query=sales" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create task

Creates a single task on a file.

<!-- sample post_tasks -->
```bash
curl -i -X POST "https://api.box.com/2.0/tasks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "item": {
         "id": "11446498",
         "type": "file"
       },
       "action": "review"
     }'
```

## Get task

Fetches a specific task.

<!-- sample get_tasks_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/tasks/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update task

Updates a specific task.

<!-- sample put_tasks_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/tasks/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "action": "review"
     }'
```

## Delete task

Deletes a specific task.

<!-- sample delete_tasks_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/tasks/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List task's assignments

Retrieves all of the assignments for a given task.

<!-- sample get_tasks_id_assignments -->
```bash
curl -i -X GET "https://api.box.com/2.0/tasks/12345/assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Assign task

Assigns a task to a user.

Multiple assignments to different users
are allowed per task.

<!-- sample post_task_assignments -->
```bash
curl -i -X POST "https://api.box.com/2.0/task_assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "task": {
         "id": "11446498",
         "type": "task"
       },
       "assign_to": {
         "id": "4823213"
       }
     }'
```

## Get task assignment

Fetches a specific task assignment.

<!-- sample get_task_assignments_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/task_assignments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update task assignment

Updates a task assignment. This endpoint can be
used to update the state of a task.

<!-- sample put_task_assignments_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/task_assignments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "message": "New message",
       "resolution_state": "completed"
     }'
```

## Unassign task

Deletes a specific task assignment.

<!-- sample delete_task_assignments_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/task_assignments/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Find item for shared link

Return the file or folder represented by a shared link.

Shared items are any files or folders that are represented by a shared link,
which can originate within the current enterprise or within another one.

This endpoint allows an application to retrieve information about a
shared item when only given a shared link.

<!-- sample get_shared_items -->
```bash
curl -i -X GET "https://api.box.com/2.0/shared_items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "BoxApi: shared_link=https://app.box.com/s/gjasdasjhasd&shared_link_password=letmein"
```

The syntax is the same regardless of wether the shared link is a file or a folder.

<!-- sample get_shared_items folders -->
```bash
curl -i -X GET "https://api.box.com/2.0/shared_items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "BoxApi: shared_link=https://app.box.com/s/jsasdsd8sad24&shared_link_password=letmein"
```

## Create web link

Creates a web link object within a folder.

<!-- sample post_web_links -->
```bash
curl -i -X POST "https://api.box.com/2.0/web_links" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Cloud Content Management",
       "url": "https://box.com",
       "parent": {
         "id": "0"
       }
     }'
```

## Get web link

Retrieve information about a web link.

<!-- sample get_web_links_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Restore web link

Restores an web link that has been moved to the trash.

<!-- sample post_web_links_id -->
```bash
curl -i -X POST "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
```

## Update web link

Updates a web link object.

<!-- sample put_web_links_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Cloud Content Management"
     }'
```

## Delete web link

Deletes a web link.

<!-- sample delete_web_links_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get trashed web link

Retrieves a web link that has been moved to the trash.

<!-- sample get_web_links_id_trash -->
```bash
curl -i -X GET "https://api.box.com/2.0/web_links/12345/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Permanently delete web link

Permanently deletes a web link that is in the trash.
This action cannot be undone.

<!-- sample delete_web_links_id_trash -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/web_links/12345/trash" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List enterprise users

Returns a list of all users for the Enterprise along with their user_id,
public_name, and login.

The application and the authenticated user need to
have the permission to look up users in the entire
enterprise.

<!-- sample get_users -->
```bash
curl -i -X GET "https://api.box.com/2.0/users" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create user

Creates a new managed user in an enterprise. This endpoint
is only available to users and applications with the right
admin permissions.

<!-- sample post_users -->
```bash
curl -i -X POST "https://api.box.com/2.0/users" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "login": "ceo@example.com",
       "name": "Aaron Levie"
     }'
```

## Get authenticated user

Retrieves information about the user who is currently authenticated.

In the case of a 3-legged OAuth2, client-side authenticated application
this will be the user who authorized the app.

In the case of a JWT, server-side authenticated application
this will be the service account that belongs to the application
by default.

Use the `As-User` header to change who this API call is made on behalf of.

<!-- sample get_users_me -->
```bash
curl -i -X GET "https://api.box.com/2.0/users/me" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get user

Retrieves information about a user in the enterprise.

The application and the authenticated user need to
have the permission to look up users in the entire
enterprise.

This endpoint also returns a limited set of information
for external users who are collaborated on content
owned by the enterprise for authenticated users with the
right scopes. In this case, disallowed fields will return
null instead.

<!-- sample get_users_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/users/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update user

Updates a managed user in an enterprise. This endpoint
is only available to users and applications with the right
admin permissions.

<!-- sample put_users_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/users/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Aaron Levie"
     }'
```

## Delete user

Deletes a user. By default this will fail if the user
still owns any content. Move their owned content first
before proceeding, or use the `force` field to delete
the user and their files.

<!-- sample delete_users_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/users/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get user avatar

Retrieves an image of a the user's avatar.

<!-- sample get_users_id_avatar -->
```bash
curl -i -X GET "https://api.box.com/2.0/users/12345/avatar" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Transfer owned folders

Move all of the items owned by a user into a
new folder in another user’s account.

Only the root folder (`0`) can be transferred.

Folders can only be moved across users by users with administrative
permissions.

This call will be performed synchronously which might lead to a slow response
when the source user has a large number of items in all of its folders.

If the destination path has a metadata cascade policy attached to any of
the parent folders, a metadata cascade operation will be kicked off
asynchronously.

There is currently no way to check for when this operation is finished.

<!-- sample put_users_id_folders_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/users/12345/folders/0" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "owned_by": {
         "id": "1232234"
       }
     }'
```

## List user's email aliases

Retrieves all email aliases for a user. The collection
does not include the primary login for the user.

<!-- sample get_users_id_email_aliases -->
```bash
curl -i -X GET "https://api.box.com/2.0/users/12345/email_aliases" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create email alias

Adds a new email alias to a user account..

<!-- sample post_users_id_email_aliases -->
```bash
curl -i -X POST "https://api.box.com/2.0/users/12345/email_aliases" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "email": "alias@example.com"
     }'
```

## Remove email alias

Removes an email alias from a user.

<!-- sample delete_users_id_email_aliases_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/users/12345/email_aliases/23432" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List user's groups

Retrieves all the groups for a user. The user making
an API call must have admin permissions to inspect the
enterprise's groups.

<!-- sample get_users_id_memberships -->
```bash
curl -i -X GET "https://api.box.com/2.0/users/12345/memberships" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Invite user

Invites an existing external user to join an enterprise.

The existing user can not be part of another enterprise and
must already have a Box account. Once invited, the user will receive an
email and are prompted to accept the invitation within the
Box web application.

This method requires the "Manage An Enterprise" scope enabled for
the application, which can be enabled within the developer console.

<!-- sample post_invites -->
```bash
curl -i -X POST "https://api.box.com/2.0/invites" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "enterprise": {
         "id": "1232234"
       },
       "actionable_by": {
         "login" : "freeuser@box.com"
       }
     }'
```

## Get user invite status

Returns the status of a user invite.

<!-- sample get_invites_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/invites/213723" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List enterprise groups

Retrieves all of the groups for a given enterprise. The user
must have admin permissions to inspect enterprise's groups.

<!-- sample get_groups -->
```bash
curl -i -X GET "https://api.box.com/2.0/groups" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create group

Creates a new group of users in an enterprise. Only users with admin
permissions can create new groups.

<!-- sample post_groups -->
```bash
curl -i -X POST "https://api.box.com/2.0/groups" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Customer Support"
     }'
```

## Get group

Retrieves information about a group.

<!-- sample get_groups_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/groups/57645" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update group

Updates a specific group.

<!-- sample put_groups_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/groups/57645" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "Customer Support"
     }'
```

## Delete group

Permanently deletes a group.

<!-- sample delete_groups_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/groups/57645" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List group's members

Retrieves all the members for a group. The user
must have admin permissions to inspect enterprise's groups.

<!-- sample get_groups_id_memberships -->
```bash
curl -i -X GET "https://api.box.com/2.0/groups/57645/memberships" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List group's collaborations

Retrieves all the collaborations for a group. The user
must have admin permissions to inspect enterprise's groups.

Each collaboration object has details on which files or
folders the group has access to and with what role.

<!-- sample get_groups_id_collaborations -->
```bash
curl -i -X GET "https://api.box.com/2.0/groups/57645/collaborations" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add user to group

Creates a group membership

<!-- sample post_group_memberships -->
```bash
curl -i -X POST "https://api.box.com/2.0/group_memberships" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "user": {
         "id": "1434325"
       },
       "group": {
         "id": "4545523"
       }
     }'
```

## Get group membership

Retrieves a specific group membership.

<!-- sample get_group_memberships_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/group_memberships/434534" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update user's membership

Updates a user's group membership.

<!-- sample put_group_memberships_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/group_memberships/434534" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "role": "admin"
     }'
```

## Remove user from group

Deletes a specific group membership.

<!-- sample delete_group_memberships_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/group_memberships/434534" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List all webhooks

Returns all defined webhooks for the requesting application.

<!-- sample get_webhooks -->
```bash
curl -i -X GET "https://api.box.com/2.0/webhooks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create webhook

Creates a webhook.

<!-- sample post_webhooks -->
```bash
curl -i -X POST "https://api.box.com/2.0/webhooks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "target": {
         "id": "21322",
         "type": "file"
       },
       "address": "https://example.com/webhooks",
       "triggers": [
         "FILE.PREVIEWED"
       ]
     }'
```

<!-- sample post_webhooks for_folder -->
```bash
curl -i -X POST "https://api.box.com/2.0/webhooks" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "target": {
         "id": "234234",
         "type": "folder"
       },
       "address": "https://example.com/webhooks",
       "triggers": [
         "FILE.UPLOADED"
       ]
     }'
```

## Get webhook

Retrieves a specific webhook

<!-- sample get_webhooks_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/webhooks/3321123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update webhook

Updates a webhook.

<!-- sample put_webhooks_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/webhooks/3321123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "triggers": [
         "FILE.DOWNLOADED"
       ]
     }'
```

## Delete webhook

Deletes a webhook.

<!-- sample delete_webhooks_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/webhooks/3321123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update skill invocation

Updates the status, usage and response metadata of a
skill invocation.

<!-- sample put_skill_invocations_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/skill_invocations/33243242" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "status": "success",
       "metadata": {
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
       },
       "file": {
         "id": "12345"
       },
       "usage": {
         "unit": "file",
         "value": 1
       }
     }'
```

## List Skill cards on file

<!-- sample get_files_id_metadata_global_boxSkillsCards -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345/metadata/global/boxSkillsCards" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create Skill cards on file

<!-- sample post_files_id_metadata_global_boxSkillsCards -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345/metadata/global/boxSkillsCards" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
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
```

## Update Skill cards on file

<!-- sample put_files_id_metadata_global_boxSkillsCards -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345/metadata/global/boxSkillsCards" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[
       "op": "replace",
       "path": "/cards/0",
       "value": {
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
       }
     ]'
```

## Delete Skill cards from file

<!-- sample delete_files_id_metadata_global_boxSkillsCards -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/metadata/global/boxSkillsCards" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get a long poll endpoint

Returns a list of real-time servers that can be used for long-polling updates
to the [event stream](#get-events).

Long polling is the concept where a HTTP request is kept open until the
server sends a response, then repeating the process over and over to receive
updated responses.

Long polling the event stream can only be used for user events, not for
enterprise events.

To use long polling, first use this endpoint to retrieve a list of long poll
URLs. Next, make a long poll request to any of the provided URLs.

When an event occurs in monitored account a response with the value
`new_change` will be sent. The response contains no other details as
it simply serves as a prompt to take further action such as sending a
request to the [events endpoint](#get-events) with the last known
`stream_position`.

After the server sends this response it closes the connection. You must now
repeat the long poll process to begin listening for events again.

If no events occur for a while and the connection times out you will
receive a response with the value `reconnect`. When you receive this response
you’ll make another call to this endpoint to restart the process.

If you receive no events in `retry_timeout` seconds then you will need to
make another request to the real-time server (one of the URLs in the response
for this endpoint). This might be necessary due to network errors.

Finally, if you receive a `max_retries` error when making a request to the
real-time server, you should start over by making a call to this endpoint
first.

<!-- sample options_events -->
```bash
curl -i -X OPTIONS "https://api.box.com/2.0/events" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get user and enterprise events

Returns up to a year of past events for a given user
or for the entire enterprise.

By default this returns events for the authenticated user. To retrieve
events for the entire enterprise, set the `stream_type` to `admin_logs`
(historical - 1 year) or `admin_logs_streaming` (live - two weeks). The user
making the API call will need to have admin privileges, and the application will
need to have the permission to access the event feed to get the enterprise event
feed.

<!-- sample get_events -->
```bash
curl -i -X GET "https://api.box.com/2.0/events" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

<!-- sample get_events enterprise -->
```bash
curl -i -X GET "https://api.box.com/2.0/events?stream_type=admin_logs" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

<!-- sample get_events enterprise_filter -->
```bash
curl -i -X GET "https://api.box.com/2.0/events?stream_type=admin_logs&event_type=LOGIN,FAILED_LOGIN" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

<!-- sample get_events enterprise_stream -->
```bash
curl -i -X GET "https://api.box.com/2.0/events?stream_type=admin_logs_streaming" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

<!-- sample get_events enterprise_stream_filter -->
```bash
curl -i -X GET "https://api.box.com/2.0/events?stream_type=admin_logs_streaming&event_type=LOGIN,FAILED_LOGIN" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List all collections

Retrieves all collections for a given user.

Currently, only the `favorites` collection
is supported.

<!-- sample get_collections -->
```bash
curl -i -X GET "https://api.box.com/2.0/collections" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List collection items

Retrieves the files and/or folders contained within
this collection.

<!-- sample get_collections_id_items -->
```bash
curl -i -X GET "https://api.box.com/2.0/collections/926489/items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add file to collection

<!-- sample put_files_id add_to_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": [
          {
            "id": "123"
          }
       ]
     }'
```

## Add folder to collection

<!-- sample put_folders_id add_to_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": [
          {
            "id": "123"
          }
       ]
     }'
```

## Add web link to collection

<!-- sample put_web_links_id add_to_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": [
          {
            "id": "123"
          }
       ]
     }'
```

## Remove file from collection

<!-- sample put_files_id remove_from_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": []
     }'
```

## Remove folder from collection

<!-- sample put_folders_id remove_from_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": []
     }'
```

## Remove web link from collection

<!-- sample put_web_links_id remove_from_collection -->
```bash
curl -i -X PUT "https://api.box.com/2.0/web_links/12345" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "collections": []
     }'
```

## List recent items

Returns information about the recent items accessed
by a user, either in the last 90 days or up to the last
1000 items accessed.

<!-- sample get_recent_items -->
```bash
curl -i -X GET "https://api.box.com/2.0/recent_items" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List retention policies

Retrieves all of the retention policies for an enterprise.

<!-- sample get_retention_policies -->
```bash
curl -i -X GET "https://api.box.com/2.0/retention_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create retention policy

Creates a retention policy.

<!-- sample post_retention_policies -->
```bash
curl -i -X POST "https://api.box.com/2.0/retention_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "policy_name": "Some Policy Name",
       "policy_type": "finite",
       "retention_length": 365,
       "disposition_action": "permanently_delete"
     }'
```

## Get retention policy

Retrieves a retention policy.

<!-- sample get_retention_policies_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/retention_policies/982312" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update retention policy

Updates a retention policy.

<!-- sample put_retention_policies_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/retention_policies/982312" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "disposition_action": "permanently_delete"
     }'
```

## List policy's assignments

Returns a list of all retention policy assignments associated with a specified
retention policy.

<!-- sample get_retention_policies_id_assignments -->
```bash
curl -i -X GET "https://api.box.com/2.0/retention_policies/982312/assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Assign retention policy

Assigns a retention policy to an item.

<!-- sample post_retention_policy_assignments -->
```bash
curl -i -X POST "https://api.box.com/2.0/retention_policy_assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "policy_id": "173463",
       "assign_to": {
         "type": "folder",
         "id": "6564564"
       }
     }'
```

## Get policy assignment

Retrieves a retention policy assignment

<!-- sample get_retention_policy_assignments_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/retention_policy_assignments/1233123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List all legal hold policies

Retrieves a list of legal hold policies that belong to
an enterprise.

<!-- sample get_legal_hold_policies -->
```bash
curl -i -X GET "https://api.box.com/2.0/legal_hold_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create legal hold policy

Create a new legal hold policy.

<!-- sample post_legal_hold_policies -->
```bash
curl -i -X POST "https://api.box.com/2.0/legal_hold_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "policy_name": "Policy 3",
       "description": "Automatic created policy"
     }'
```

## Get legal hold policy

Retrieve a legal hold policy.

<!-- sample get_legal_hold_policies_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/legal_hold_policies/324432" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update legal hold policy

Update legal hold policy.

<!-- sample put_legal_hold_policies_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/legal_hold_policies/324432" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "policy_name": "Policy 4"
     }'
```

## Delete legal hold policy

Delete an existing legal hold policy.

This is an asynchronous process. The policy will not be
fully deleted yet when the response returns.

<!-- sample delete_legal_hold_policies_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/legal_hold_policies/324432" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List policy's assignments

Retrieves a list of items a legal hold policy has been assigned to.

<!-- sample get_legal_hold_policy_assignments -->
```bash
curl -i -X GET "https://api.box.com/2.0/legal_hold_policy_assignments?policy_id=324432" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Assign legal hold policy

Assign a legal hold to a file, file version, folder, or user.

<!-- sample post_legal_hold_policy_assignments -->
```bash
curl -i -X POST "https://api.box.com/2.0/legal_hold_policy_assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "policy_id": "123244",
       "assign_to": {
         "type": "folder",
         "id": "6564564"
       }
     }'
```

## Get policy assignment

Retrieve a legal hold policy assignment.

<!-- sample get_legal_hold_policy_assignments_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/legal_hold_policy_assignments/753465" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Unassign legal hold policy

Remove a legal hold from an item.

This is an asynchronous process. The policy will not be
fully removed yet when the response returns.

<!-- sample delete_legal_hold_policy_assignments_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/legal_hold_policy_assignments/753465" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get retention for file

Returns information about a file version retention.

<!-- sample get_file_version_retentions_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/file_version_retentions/3424234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List retentions on files

Retrieves all file version retentions for the given enterprise.

<!-- sample get_file_version_retentions -->
```bash
curl -i -X GET "https://api.box.com/2.0/file_version_retentions" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List files under retention for a retention policy

Retrieves all files for the given retention policy id.

<!-- sample get_retention_policy_assignments_id_files_under_retention -->
```bash
curl -i -X GET "https://app.box.com/api/2.0/retention_policy_assignments/3424234/files_under_retention" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List file versions under retention for a retention policy

Retrieves all file versions for the given retention policy id.

<!-- sample get_retention_policy_assignments_id_file_versions_under_retention -->
```bash
curl -i -X GET "https://app.box.com/api/2.0/retention_policy_assignments/3424234/file_versions_under_retention" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Inspect legal hold on file

Retrieves information about the legal hold policies
assigned to a file version.

<!-- sample get_file_version_legal_holds_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/file_version_legal_holds/2348213" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List legal holds for policy

Get list of non-deleted legal holds for a single legal
hold policy.

<!-- sample get_file_version_legal_holds -->
```bash
curl -i -X GET "https://api.box.com/2.0/file_version_legal_holds?policy_id=133870" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get device pin

Retrieves information about an individual device pin.

<!-- sample get_device_pinners_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/device_pinners/2324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Delete device pin

Deletes an individual device pin.

<!-- sample delete_device_pinners_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/device_pinners/2324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List enterprise device pins

Retrieves all the device pins within an enterprise.

The user must have admin privileges, and the application
needs the "manage enterprise" scope to make this call.

<!-- sample get_enterprises_id_device_pinners -->
```bash
curl -i -X GET "https://api.box.com/2.0/enterprises/3442311/device_pinners" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List terms of services

Returns the current terms of service text and settings
for the enterprise.

<!-- sample get_terms_of_services -->
```bash
curl -i -X GET "https://api.box.com/2.0/terms_of_services" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create terms of service

Creates a terms of service for a given enterprise
and type of user.

<!-- sample post_terms_of_services -->
```bash
curl -i -X POST "https://api.box.com/2.0/terms_of_services" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "status": "enabled",
       "text": "By collaborating on this file you are accepting..."
     }'
```

## Get terms of service

Fetches a specific terms of service.

<!-- sample get_terms_of_services_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/terms_of_services/324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update terms of service

Updates a specific terms of service.

<!-- sample put_terms_of_services_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/terms_of_services/324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "status": "enabled",
       "text": "By collaborating on this file you are accepting..."
     }'
```

## List ToS user statuses

Retrieves an overview of users and their status for a
terms of service, including Whether they have accepted
the terms and when.

<!-- sample get_terms_of_service_user_statuses -->
```bash
curl -i -X GET "https://api.box.com/2.0/terms_of_service_user_statuses?tos_id=324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Set status for new user

Sets the status for a terms of service for a user.

<!-- sample post_terms_of_service_user_statuses -->
```bash
curl -i -X POST "https://api.box.com/2.0/terms_of_service_user_statuses" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "tos": {
         "type": "terms_of_service",
         "id": "1232132"
       },
       "user": {
         "type": "user",
         "id": "3423423"
       },
       "is_accepted": true
     }'
```

## Set status for existing user

Updates the status for a terms of service for a user.

<!-- sample put_terms_of_service_user_statuses_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/terms_of_service_user_statuses/324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "is_accepted": true
     }'
```

## List whitelist entries

Returns the list of whitelist entries which specify what domains can
collaborate with the current enterprise.

<!-- sample get_collaboration_whitelist_entries -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaboration_whitelist_entries" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create whitelist entry

Creates a collaboration whitelist entry, specifying a domain
and direction to allow collaboration for.

<!-- sample post_collaboration_whitelist_entries -->
```bash
curl -i -X POST "https://api.box.com/2.0/collaboration_whitelist_entries" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "domain": "example.com",
       "direction": "inboud"
     }'
```

## Get whitelist entry

Returns a specific collaboration whitelist entry.

<!-- sample get_collaboration_whitelist_entries_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaboration_whitelist_entries/213123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Delete whitelist entry

Deletes a specific collaboration whitelist entry.

<!-- sample delete_collaboration_whitelist_entries_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/collaboration_whitelist_entries/213123" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List whitelist exemptions

Returns a list of users who have been exempt from the collaboration
whitelist.

<!-- sample get_collaboration_whitelist_exempt_targets -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaboration_whitelist_exempt_targets" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Create whitelist exemption

Creates a collaboration whitelist entry exemption, specifying a user
that is exempted from the whitelist.

<!-- sample post_collaboration_whitelist_exempt_targets -->
```bash
curl -i -X POST "https://api.box.com/2.0/collaboration_whitelist_exempt_targets" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "user": {
         "id": "23522323"
       }
     }'
```

## Get whitelist exemption

Returns a users who has been exempt from the collaboration
whitelist.

<!-- sample get_collaboration_whitelist_exempt_targets_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/collaboration_whitelist_exempt_targets/984923" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Remove whitelist exemption

Deletes a specific collaboration whitelist exemption.

<!-- sample delete_collaboration_whitelist_exempt_targets_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/collaboration_whitelist_exempt_targets/984923" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List storage policies

Fetches all the storage policies in the enterprise.

<!-- sample get_storage_policies -->
```bash
curl -i -X GET "https://api.box.com/2.0/storage_policies" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get storage policy

Fetches a specific storage policy.

<!-- sample get_storage_policies_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/storage_policies/34342" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## List policy assignments

Fetches all the storage policy assignment for an enterprise or user.

<!-- sample get_storage_policy_assignments -->
```bash
curl -i -X GET "https://api.box.com/2.0/storage_policy_assignments?resolved_for_type=userresolved_for_id=984322" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Assign storage policy

Creates a storage policy assignment for an enterprise or user.

<!-- sample post_storage_policy_assignments -->
```bash
curl -i -X POST "https://api.box.com/2.0/storage_policy_assignments" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "storage_policy": {
         "type": "storage_policy",
         "id": "1434325"
       },
       "assigned_to": {
         "type": "user",
         "id": "9987987"
       }
     }'
```

## Get policy assignment

Fetches a specific storage policy assignment.

<!-- sample get_storage_policy_assignments_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/storage_policy_assignments/932483" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Update policy assignment

Updates a specific storage policy assignment.

<!-- sample put_storage_policy_assignments_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/storage_policy_assignments/932483" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "storage_policy": {
         "type": "storage_policy",
         "id": "1434325"
       }
     }'
```

## Unassign storage policy

Delete a storage policy assignment.

Deleting a storage policy assignment on a user
will have the user inherit the enterprise's default
storage policy.

There is a rate limit for calling this endpoint of only
twice per user in a 24 hour period.

<!-- sample delete_storage_policy_assignments_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/storage_policy_assignments/932483" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "items": {
         "type": "storage_policy",
         "id": "1434325"
       }
     }'
```


## Create zip download

<!-- sample post_zip_downloads -->
```bash
curl -i -X POST "https://api.box.com/2.0/zip_downloads" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "download_file_name": "January Financials",
       "items": [
         {
           "type": "file",
           "id": "12345"
         },
         {
           "type": "file",
           "id": "34325"
         },
         {
           "type": "folder",
           "id": "45678"
         }
       ]
     }'
```

## Get zip download status

<!-- sample get_zip_downloads_id_status -->
```bash
curl -i -X GET "https://api.box.com/2.0/zip_downloads/29l00nfxDyHOt7RphI9zT_w==nDnZEDjY2S8iEWWCHEEiptFxwoWojjlibZjJ6geuE5xnXENDTPxzgbks_yY=/status" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Download zip archive

<!-- sample get_zip_downloads_id_content -->
```bash
curl -i -X GET "https://dl.boxcloud.com/2.0/zip_downloads/29l00nfxDyHOt7RphI9zT_w==nDnZEDjY2S8iEWWCHEEiptFxwoWojjlibZjJ6geuE5xnXENDTPxzgbks_yY=/content"
```

## List all classifications
<!-- sample get_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema -->
```bash
curl -i -X GET "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add initial classifications

<!-- sample post_metadata_templates_schema classifications -->
```bash
curl -i -X POST "https://api.box.com/2.0/metadata_templates/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "templateKey": "securityClassification-6VMVochwUWo",
       "scope": "enterprise",
       "displayName": "Classification",
       "hidden": false,
       "copyInstanceOnItemCopy": true,
       "fields": [
         {
           "type": "enum",
           "key": "Box__Security__Classification__Key",
           "displayName": "Classification",
           "hidden": false,
           "options": [
             {
               "key": "Classified",
               "staticConfig": {
                 "classification": {
                   "colorID": 7,
                   "classificationDefinition": "Top Seret"
                 }
               }
             }
           ]
         }
       ]
     }'
```

## Add another classification

<!-- sample put_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema add -->
```bash
curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[{
       "op": "addEnumOption",
       "fieldKey": "Box__Security__Classification__Key",
       "data": {
         "key": "Sensitive",
         "classification": {
           "classificationDefinition": "Sensitive information that must not be shared.",
           "colorID": 4
         }
       }
     }]'
```

## Update classification

<!-- sample put_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema update -->
```bash
curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[{
       "op": "editEnumOption",
       "fieldKey": "Box__Security__Classification__Key",
       "enumOptionKey": "Sensitive",
       "data": {
         "key": "Very Sensitive",
         "classification": {
           "classificationDefinition": "Sensitive information that must not be shared.",
           "colorID": 4
         }
       }
     }]'
```

## Delete classification

<!-- sample put_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema delete -->
```bash
curl -i -X PUT "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[{
       "op": "removeEnumOption",
       "fieldKey": "Box__Security__Classification__Key",
       "enumOptionKey": "Sensitive"
     }]'
```

## Delete all classifications

<!-- sample delete_metadata_templates_enterprise_securityClassification-6VMVochwUWo_schema -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/metadata_templates/enterprise/securityClassification-6VMVochwUWo/schema" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get classification on file

<!-- sample get_files_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add classification to file

<!-- sample post_files_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X POST "https://api.box.com/2.0/files/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "Box__Security__Classification__Key": "Sensitive"
     }'
```

## Update classification on file

<!-- sample put_files_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[{
       "op": "replace",
       "path": "/Box__Security__Classification__Key",
       "value": "Internal"
     }]'
```

## Remove classification from file

<!-- sample delete_files_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/files/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get classification on folder

<!-- sample get_folders_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add classification to folder

<!-- sample post_folders_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X POST "https://api.box.com/2.0/folders/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json" \
     -d '{
       "Box__Security__Classification__Key": "Sensitive"
     }'
```

## Update classification on folder

<!-- sample put_folders_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -H "Content-Type: application/json-patch+json" \
     -d '[{
       "op": "replace",
       "path": "/Box__Security__Classification__Key",
       "value": "Internal"
     }]'
```

## Remove classification from folder

<!-- sample delete_folders_id_metadata_enterprise_securityClassification-6VMVochwUWo -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/folders/12345/metadata/enterprise/securityClassification-6VMVochwUWo" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Copy a file request

<!-- sample post_file_requests_id_copy -->
```bash
curl -i -X POST "https://api.box.com/2.0/file_requests/42037322/copy" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "title": "Please upload required documents",
       "description": "Please upload required documents",
       "status": "active",
       "is_email_required": true,
       "is_description_required": false,
       "folder": {
         "id": "2233212",
         "type": "folder" 
       }
     }'
```

## Update a file request

<!-- sample put_file_requests_id -->
```bash
curl -i -X PUT "https://api.box.com/2.0/file_requests/42037322" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "title": "Please upload required documents",
       "description": "Please upload required documents",
       "status": "active",
       "is_email_required": true,
       "is_description_required": false
     }'
```

## Get a file request

<!-- sample get_file_requests_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/file_requests/42037322" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Delete a file request

<!-- sample delete_file_requests_id -->
```bash
curl -i -X DELETE "https://api.box.com/2.0/file_requests/42037322" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get shared link on a file

<!-- sample get_files_id get_shared_link -->
```bash
curl -i -X GET "https://api.box.com/2.0/files/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add shared link to a file

<!-- sample put_files_id add_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
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
```

## Update shared link on a file

<!-- sample put_files_id update_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
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
```

## Remove shared link from a file

<!-- sample put_files_id remove_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/files/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "shared_link": null
     }'
```

## Get shared link on a folder

<!-- sample get_folders_id get_shared_link -->
```bash
curl -i -X GET "https://api.box.com/2.0/folders/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Add shared link to a folder

<!-- sample put_folders_id add_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
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
```

## Update shared link on a folder

<!-- sample put_folders_id update_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
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
```

## Remove shared link from a folder

<!-- sample put_folders_id remove_shared_link -->
```bash
curl -i -X PUT "https://api.box.com/2.0/folders/32423234?fields=shared_link" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "shared_link": null
     }'
```

## Gets a relay workflow with flows that are of type WORKFLOW_MANUAL_START

<!-- sample get_workflows -->
```bash
curl -i -X GET "https://api.box.com/2.0/workflows?folder_id=324234" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" 
```

## Start a flow in a relay workflow of type WORKFLOW_MANUAL_START

<!-- sample post_workflows_id_start -->
```bash
curl -i -X POST "https://api.box.com/2.0/workflows/42037322/start" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
     -d '{
       "type": "workflow_parameters",
       "flow": {
        "id": "8937625", 
        "type": "flow"
       },
       "files": [{
          "type": "file",
          "id": "389047572"
        }, 
        {
          "type": "file",
          "id": "389047578"
        }],
       "folder": {
         "id": "2233212",
         "type": "folder" 
       }, 
       "outcomes": [
          {
            "id": "34895783",
            "type": "outcome",
            "task_collaborators": {
                "type": "variable",
                "variable_type": "user_list",
                "variable_value": [{ "type": "user", "id": "890273642" }]
            },
            "completion_rule": {
                "type": "variable",
                "variable_type": "task_completion_rule",
                "variable_value": "all_assignees"
            },
            "file_collaborator_role": {
                "type": "variable",
                "variable_type": "collaborator_role",
                "variable_value": "viewer"
            }
          }
        ]
     }'
```
## Create Box Sign request

<!-- sample post_sign_requests -->
```bash
curl -i -X POST "https://api.box.com/2.0/sign_requests" \
     -H "Authorization: Bearer <ACCESS_TOKEN>" \
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
```

## Get Box Sign requests

<!-- sample get_sign_requests -->
```bash
curl -i -X GET "https://api.box.com/2.0/sign_requests" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Get Box Sign request by ID

<!-- sample get_sign_requests_id -->
```bash
curl -i -X GET "https://api.box.com/2.0/sign_requests/<SIGN_REQUEST_ID>" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Cancel Box Sign request

<!-- sample post_sign_requests_id_cancel -->
```bash
curl -i -X POST "https://api.box.com/2.0/sign_requests/<SIGN_REQUEST_ID>/cancel" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```

## Resend Box Sign request

<!-- sample post_sign_requests_id_resend -->
```bash
curl -i -X POST "https://api.box.com/2.0/sign_requests/<SIGN_REQUEST_ID>/resend" \
     -H "Authorization: Bearer <ACCESS_TOKEN>"
```
