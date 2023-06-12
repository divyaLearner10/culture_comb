class CreateFavoriteCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :favorite_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
