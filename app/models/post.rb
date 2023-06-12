class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city

  validates :title, :website_url, :content, presence: true
end
