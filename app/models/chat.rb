class Chat < ApplicationRecord
  belongs_to :game
  belongs_to :team, optional: true
end
