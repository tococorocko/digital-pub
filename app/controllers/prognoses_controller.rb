class PrognosesController < ApplicationController
  def new
    @game = Game.find(params[:id])
    @prognosis = Prognosis.new
  end

  def create
    @game = Game.find(params[:game_id])
    @prognosis = Prognosis.new(params_prognosis)
    @prognosis.game = @game
    @prognosis.user = current_user
    @prognosis.save
    redirect_to game_chats_path
  end

  private

  def params_prognosis
    params.require(:prognosis).permit(:team_a_score, :team_b_score)
  end
end
