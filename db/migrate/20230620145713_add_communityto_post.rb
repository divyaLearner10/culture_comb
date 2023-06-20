class AddCommunitytoPost < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :community, foreign_key: true, null: true
  end
end
