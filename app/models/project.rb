class Project < ActiveRecord::Base
	has_many :notes, dependent: :destroy
	belongs_to :user
	has_many :tasks, dependent: :destroy
end
