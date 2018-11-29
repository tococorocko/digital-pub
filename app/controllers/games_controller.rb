require 'date'

class GamesController < ApplicationController
  def index
    @date = Date.today
    @time = Time.now.utc
    @user = current_user

    @league = League.find(params[:league]) || League.first

    @games = Game.where(league: @league)
  end
end
