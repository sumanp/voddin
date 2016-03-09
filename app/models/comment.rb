class Comment < ActiveRecord::Base
	belongs_to :task
	mount_uploaders :attachments, AttachmentUploader
end
