class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @leagues = League.all
    @favteams = FavoriteTeam.where(user: current_user)
    @games = []
    @favteams.each do |t|
      t.team.games.each do |g|
        @games << g if g.kick_off_time >= Date.today
      end
    end
    @games.sort! { |a,b| a.kick_off_time <=> b.kick_off_time }
  end

  def rank
    @users = User.all
    @rank = []

    @users.each do |u|
      if u.score > 0
        @rank << u
      end
    end
    @rank.sort! { |a,b| b.score <=> a.score }
  end
end
