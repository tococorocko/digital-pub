class FavoriteTeamsController < ApplicationController

  def new
    @favoriteteam = FavoriteTeam.new
  end

  def create
    @favoriteteam = FavoriteTeam.new(team_params)
    @favoriteteam.user = current_user
    if existing_team? == false
      @favoriteteam.save
      redirect_to preferences_path
    else
      flash[:alert] = "Duplicate"
      render 'new'
      flash.delete(:alert)
    end
  end

  def destroy
    @favoriteteam = FavoriteTeam.find(params[:id])
    @favoriteteam.destroy
    redirect_to preferences_path
  end

  private
  def team_params
    params.require(:favorite_team).permit(:user_id, :team_id)
  end

  def existing_team?
    current_user.favorite_teams.where(team_id: @favoriteteam.team_id).any?
  end
end
