class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @games = Game.all
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:name, :category, :player_min, :player_max, :condition, :price_per_day)
  end
end
