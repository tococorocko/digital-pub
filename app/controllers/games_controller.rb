class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @date = Date.today
    @time = Time.now.utc
    @max_date = @date + 5
    @games_1 = []
    @games_2 = []

    @league = League.find(params[:league]) || League.first

    @games = Game.where(league: @league)

    @games.each do |g|
      #old_game = g.kick_off_time - 60.minutes

      # TODAYS NEXT GAMES
      if g.chats.first.online == false && g.kick_off_time.to_date == @date && g.kick_off_time > Time.now
        @games_2 << g
      # NEXT 5 DAYS GAMES
      elsif g.kick_off_time.to_date > @date && g.kick_off_time.to_date <= @max_date
        @games_2 << g
      # ONLINE GAMES
      elsif g.chats.first.online == true
        @games_1 << g
      end
    @games_2.sort! { |a,b| a.kick_off_time <=> b.kick_off_time }
    end
  end
end
