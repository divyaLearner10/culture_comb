class RemoveUserInfo < ActiveRecord::Migration[7.0]
  def change
    remove_column :chatrooms, :asker_id
    remove_column :chatrooms, :receiver_id
    add_column :chatrooms, :name, :string
  end
end
