class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :website_url
      t.date :date
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :phone_number
      t.time :start_time
      t.references :city, null: false, foreign_key: true
      t.references :community, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
