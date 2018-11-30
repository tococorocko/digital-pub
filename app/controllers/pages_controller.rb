class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

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

  def about

  end
end
