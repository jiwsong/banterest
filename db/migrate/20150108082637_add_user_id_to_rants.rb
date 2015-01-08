class AddUserIdToRants < ActiveRecord::Migration
  def change
    add_column :rants, :user_id, :integer
    add_index :rants, :user_id
  end
end
