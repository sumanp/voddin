class Note < ActiveRecord::Base
  belongs_to :project
  mount_uploaders :attachments, AttachmentUploader
end
