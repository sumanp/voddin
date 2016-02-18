class AddAttachmentsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :attachments, :string, array: true, default: []
  end
end
