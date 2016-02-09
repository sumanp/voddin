class RemoveCategoryFromProject < ActiveRecord::Migration
  def change
    remove_column :projects, :category, :string
  end
end
