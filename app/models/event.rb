class Event < ApplicationRecord
  belongs_to :city
  belongs_to :community, optional: true
  belongs_to :user

  validates :name, :website_url, :description, :date, :start_time, presence: true
  validates :description, length: { minimum: 10 }
  # validates :date
  # , date: true
  # validates :event_date_cannot_be_in_the_past

  # private

  # def event_date_cannot_be_in_the_past
  #   if date.present? && date < Date.today
  #     errors.add(:date, "can't be in the past")
  #   end
  # end
end
