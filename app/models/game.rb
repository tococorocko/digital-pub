class Game < ApplicationRecord
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :league
  has_many :chats
  validates :kick_off_time, presence: true
end
