class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :community

  validates :title, :website_url, :content, presence: true

  has_one_attached :photo
end
