class AddUserColumnsToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :sender, null: false, foreign_key: { to_table: :users }
    add_reference :chatrooms, :recipient, null: false, foreign_key: { to_table: :users }
  end
end
