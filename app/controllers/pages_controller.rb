class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @leagues = League.all
    @favteams = FavoriteTeam.where(user: current_user)
    @favteams.each do |t|
      t.team.games
    end
  end
end
