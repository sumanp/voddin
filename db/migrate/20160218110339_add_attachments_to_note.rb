class AddAttachmentsToNote < ActiveRecord::Migration
  def change
    add_column :notes, :attachments, :string, array: true, default: []
  end
 
end
