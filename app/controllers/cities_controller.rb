class CitiesController < ApplicationController
  before_action :set_city, only: [:show]
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def index
    @cities = City.all
  end

  def show
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

  private

  def set_city
    @city = City.find(params[:id])
  end

  def city_params
    params.require(:city).permit(:name, :country, :description)
  end
end
