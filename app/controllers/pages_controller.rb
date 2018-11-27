class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @leagues = League.all
    @favteams = FavoriteTeam.all
  end
end
