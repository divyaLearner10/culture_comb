class Event < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  belongs_to :city
  belongs_to :community, optional: true
  belongs_to :user

  has_many_attached :photos

  validates :name, :website_url, :description, :address, :date, presence: true

  validates :description, length: { minimum: 10 }
  # validates :date
  # , date: true
  validate :event_date_cannot_be_in_the_past

  has_many :event_categories
  has_many :categories, through: :event_categories

  private
  
  def event_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end
end
