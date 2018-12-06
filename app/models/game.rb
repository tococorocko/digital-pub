class Game < ApplicationRecord
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :league
  has_many :chats, dependent: :destroy
  has_many :prognoses
  validates :kick_off_time, presence: true

  after_create :generate_chat

  def generate_chat
    #create Chat for Team A
    chat_a = Chat.create(game_id: self.id, team_id: self.team_a_id)
    chat_a.save
    #create Chat for Team B
    chat_b = Chat.create(game_id: self.id, team_id: self.team_b_id)
    chat_a.save
    #create neutral Chat
    chat_c = Chat.create(game_id: self.id)
    chat_a.save
  end

  def chat_for_team_a
    chats.find_by(team_id: team_a_id)
  end

  def chat_for_team_b
    chats.find_by(team_id: team_b_id)
  end

  def chat_neutral
    chats.find_by(team_id: nil)
  end
end
