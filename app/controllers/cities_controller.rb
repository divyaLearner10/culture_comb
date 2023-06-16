class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @images = images
  end

  def index
    @cities = City.all
  end

  def show
    @attractions = @city.attractions
    @events = @city.events
    @posts = @city.posts
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    if @city.save!
      redirect_to cities_path
    else
      render "city/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @city.update(city_params)
      redirect_to city_path(@city)
    else
      render :edit
    end
  end

  def destroy
    @city.destroy

    redirect_to cities_path
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :country, :description, :photo)
  end
end
