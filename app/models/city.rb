class City < ApplicationRecord
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }
  validates :photo, presence: true

  has_many :communities, dependent: :destroy
  has_many :attractions, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :events, dependent: :destroy

  has_one_attached :photo
end
