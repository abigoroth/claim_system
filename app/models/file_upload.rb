class FileUpload < ApplicationRecord
	belongs_to :user_monthly_approval , optional: true 
	mount_uploader :upload_document, DocumentUploader
end
