class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_chats, dependent: :destroy
  has_many :messages, through: :user_chats
  has_many :chats, through: :user_chats
  has_many :favorite_leagues, dependent: :destroy
  has_many :favorite_teams, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def user_chat_for(a_chat)
    user_chats.where(chat: a_chat).first
  end
end
