class City < ApplicationRecord
  validates :name, :country, :description, presence: true
  validates :description, length: { minimum: 10 }
end
