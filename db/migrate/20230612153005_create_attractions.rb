class CreateAttractions < ActiveRecord::Migration[7.0]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :opening_hours
      t.string :website_url
      t.float :latitude
      t.float :longitude
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
