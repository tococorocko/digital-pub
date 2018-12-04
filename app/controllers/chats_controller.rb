class ChatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @game = Game.find(params[:game_id])
    @chats = Chat.all
    @prognosis = Prognosis.new
    @prog = []
    current_user.prognoses.each { |p| @prog << p if p.game == @game }
  end

  def show
    @chat = Chat.includes(messages: :user).find(params[:id])
  end
end
