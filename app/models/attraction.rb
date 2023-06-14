class Attraction < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :city

  validates :name, :website_url, :description, :address, presence: true
  validates :description, length: { minimum: 10 }
end
