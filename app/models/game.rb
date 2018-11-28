class Game < ApplicationRecord
  belongs_to :team_a, class_name: 'Team'
  belongs_to :team_b, class_name: 'Team'
  belongs_to :league
  has_many :chats, dependent: :destroy
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

end
