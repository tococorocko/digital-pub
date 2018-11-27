class MessagesController < ApplicationController
  def create
    @message = Message.new(params_message)
    @user_chat = UserChat.find(params[:user_chat_id])
    @message.user_chat = @user_chat
    @message.save!
    @chat = @user_chat.chat
    redirect_to game_chat_path(@chat.game, @chat)
  end

  private

  def params_message
    params.require(:message).permit(:content, :user_chat_id)
  end
end
