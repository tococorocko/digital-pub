class FavoriteLeaguesController < ApplicationController

  def new
    @favoriteleague = FavoriteLeague.new
  end

  def create
    @favoriteleague = FavoriteLeague.new(league_params)
    @favoriteleague.user = current_user
    if existing_league? == false
      @favoriteleague.save
      redirect_to preferences_path
    else
      flash[:alert] = "Duplicate"
      render 'new'
      flash.delete(:alert)
    end
  end

  def destroy
    @favoriteleague = FavoriteLeague.find(params[:id])
    @favoriteleague.destroy
    redirect_to preferences_path
  end

  private

  def league_params
    params.require(:favorite_league).permit(:user_id, :league_id)
  end

  def existing_league?
    current_user.favorite_leagues.where(league_id: @favoriteleague.league_id).any?
  end

end
