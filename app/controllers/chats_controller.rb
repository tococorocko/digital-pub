class ChatsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @user_chats = @chat.user_chats
    @messages = []
    @user_chats.each do |u|
      u.messages.each do |m|
        @messages << m
      end
    end
    @messages.sort! { |a,b| a.created_at <=> b.created_at }
  end
  
end
