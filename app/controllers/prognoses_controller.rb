class PrognosesController < ApplicationController
  def new
    @game = Game.find(params[:id])
    @prognosis = Prognosis.new
  end

  def create
    @game = Game.find(params[:id])
    @prognosis = Prognosis.new(params_prognosis)
    if @prognosis.save
      redirect_to 'chats/index'
    else
      render 'new'
    end
  end

  private

  def params_prognosis
    params.require(:prognosis).permit(:team_a_score, :team_b_score)
  end
end
