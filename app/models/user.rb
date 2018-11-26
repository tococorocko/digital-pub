class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_chats
  has_many :favorite_leagues
  has_many :favorite_teams
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
