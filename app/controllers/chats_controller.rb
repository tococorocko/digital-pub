class ChatsController < ApplicationController
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
