class Message < ApplicationRecord
  belongs_to :user_chat
  validates :content, presence: true
end
