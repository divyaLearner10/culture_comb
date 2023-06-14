class Chatroom < ApplicationRecord
  belongs_to :asker
  belongs_to :receiver

  has_many :messages
end
