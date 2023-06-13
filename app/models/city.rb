class City < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }

  has_many :communities
  has_many :attractions
  has_many :posts
  has_many :events
end
