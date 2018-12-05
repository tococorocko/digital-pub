class Chat < ApplicationRecord
  belongs_to :game
  belongs_to :team, optional: true
  has_many :messages, dependent: :destroy
end
