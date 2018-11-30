class GamesController < ApplicationController
  def index
    @date = Date.today
    @time = Time.now.utc
    @max_date = @date + 5
    @games_1 = []
    @games_2 = []

    @league = League.find(params[:league]) || League.first

    @games = Game.where(league: @league)

    @games.each do |g|
      if g.chats.first.online == false
        if g.kick_off_time.to_date == @date
          old_game = g.kick_off_time.time - 60.minutes
          if g.kick_off_time.time > old_game
            @games_2 << g
          end
        elsif g.kick_off_time.to_date > @date && g.kick_off_time.to_date <= @max_date
          @games_2 << g
        end
      elsif g.chats.first.online == true
        @games_1 << g
      end
    end
  end
end
