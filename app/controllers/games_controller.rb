class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def index
    @games = Game.all

    @games = @games.search_by_name(params[:name]) if params[:name].present?

    if params['start_date'].present?
      @start_date = params['start_date'].split('to')[0].strip
      @end_date = params['start_date'].split('to')[1].strip
      @games = @games.available_on?(DateTime.parse(@start_date), DateTime.parse(@end_date))
    end

    if params[:location].present?
      @users = User.near(Geocoder.search(params[:location]).first.coordinates, 10)
      @users_id = @users.map(&:id)
      @games = @games.select { |game| @users_id.include?(game.user_id) }
    end

    @markers = @games.map do |game|
      {
        lat: game.user.latitude,
        lng: game.user.longitude
      }
    end
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
    if @game.save
      redirect_to game_path(@game)
    else
      redirect_to edit_game_path(@game)
    end
    authorize @game
  end

  def list_owned
    @owned_games = Game.where(user_id: current_user.id)
    authorize @owned_games
  end

  private

  def game_params
    params.require(:game).permit(:name,
                                 :description,
                                 :category,
                                 :player_min,
                                 :player_max,
                                 :condition,
                                 :price_per_day,
                                 :photo)
  end
end
