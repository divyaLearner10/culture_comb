class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :username, :email, presence: true

  has_many :favorite_categories
  has_many :categories, through: :favorite_categories

  has_many :events

  has_many :favorite_events
  has_many :events, through: :favorite_events

  accepts_nested_attributes_for :favorite_categories
  accepts_nested_attributes_for :categories

  has_one_attached :photo

  has_many :messages
  has_many :sent_chatrooms, class_name: 'Chatroom', foreign_key: 'sender_id'
  has_many :received_chatrooms, class_name: 'Chatroom', foreign_key: 'recipient_id'

  def all_chatrooms
    (sent_chatrooms + received_chatrooms).sort_by{|item| item.created_at}.reverse
  end

  # hand in a chatroom and it will return the user that the current_user is chatting with
  def who_am_i_chatting_with(chatroom)
    if chatroom.recipient == self
      chatroom.sender
    else
      chatroom.recipient
    end
  end
end
