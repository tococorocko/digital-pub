require 'date'

class GamesController < ApplicationController
  def index
    @date = Date.today
    @time = Time.now.utc
    @games = Game.all
    @user = current_user
    @league = League.first

    # if current_user.present? && current_user.favorite_leagues.any?
    #   @league = @user.favorite_leagues.first
    # else
    #   @league = League.first
    # end
  end
end
