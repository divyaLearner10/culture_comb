class Attraction < ApplicationRecord
  belongs_to :city

  validates :name, :website_url, :description, presence: true
  validates :description, length: { minimum: 10 }

  has_one_attached :photo
end
