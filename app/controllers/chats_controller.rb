class ChatsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @chats = Chat.all
  end

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
  end
end
