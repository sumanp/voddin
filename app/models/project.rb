class Project < ActiveRecord::Base
	mount_uploaders :attachments, AttachmentUploader
	has_many :notes, dependent: :destroy
	belongs_to :user
	has_many :tasks, dependent: :destroy
end
