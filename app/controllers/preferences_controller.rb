class PreferencesController < ApplicationController

  def index
    @favoriteteams = FavoriteTeam.where(user_id: current_user.id)
    @favoriteleagues = FavoriteLeague.where(user_id: current_user.id)
    @favoriteleague = FavoriteLeague.new
    @favoriteteam = FavoriteTeam.new
  end
end
