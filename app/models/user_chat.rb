class UserChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  has_many :messages
end
