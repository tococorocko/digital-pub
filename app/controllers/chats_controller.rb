class ChatsController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @chats = Chat.all
  end
end
