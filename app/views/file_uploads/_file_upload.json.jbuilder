json.extract! file_upload, :id, :upload_document, :created_at, :updated_at
json.url file_upload_url(file_upload, format: :json)
