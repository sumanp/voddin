class AddAttachmentsToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :attachments, :string, array: true, default: []
  end
end
