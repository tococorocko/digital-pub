class Chat < ApplicationRecord
  belongs_to :game
  belongs_to :team, optional: true
  has_many :messages

  validates :online, presence: true
end
