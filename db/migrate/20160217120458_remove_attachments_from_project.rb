class RemoveAttachmentsFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :attachments, :string
  end
end
