class AddUsertoNote < ActiveRecord::Migration
  def change
  	add_column :notes, :user, :string
  end
end
