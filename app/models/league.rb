class League < ApplicationRecord
  has_many :favorite_leagues, dependent: :destroy
  has_many :games
  validates :name, presence: true
  validates :logo, presence: true
end
