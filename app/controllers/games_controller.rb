class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @games = Game.order('name ASC')
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
    authorize @game
  end

  def new
    @game = Game.new
    authorize @game
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
  end

  def edit
    @game = Game.find(params[:id])
    authorize @game
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    authorize @game
  end

  private

  def game_params
    params.require(:game).permit(:name, :category, :player_min, :player_max, :condition, :price_per_day)
  end
end
