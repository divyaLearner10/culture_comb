class AddPropertieToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :nationality, :string
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :about, :text
    add_column :users, :current_city, :string
  end
end
