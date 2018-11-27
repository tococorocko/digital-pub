class Chat < ApplicationRecord
  belongs_to :game
  belongs_to :team, optional: true
  has_many :user_chats, dependent: :destroy
  has_many :messages, through: :user_chats
end
