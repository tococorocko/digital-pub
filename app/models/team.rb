class Team < ApplicationRecord
  has_many :favorite_teams, dependent: :destroy
  has_many :games_as_team_a, class_name: 'Game', foreign_key: :team_a
  has_many :games_as_team_b, class_name: 'Game', foreign_key: :team_b
  has_many :chats

  validates :name, presence: true
  validates :logo, presence: true

  def games
    Game.where(team_a: self).or(Game.where(team_b: self))
  end
end
