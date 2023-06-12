class Community < ApplicationRecord
  belongs_to :city
  belongs_to :user

  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }
end
