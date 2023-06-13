class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show]
  skip_before_action :authenticate_user!, only: [:new, :index, :show]

  def index
    @city = City.find(params[:city_id])
    @attractions = @city.attractions
  end

  def new
    @city = City.find(params[:city_id])
    @attraction = Attraction.new
  end

  def create
    @city = City.find(params[:city_id])

    @attraction = Attraction.new(attraction_params)
    @attraction.city = @city
    @attraction.save!

    redirect_to city_attractions_path
  end

  def show
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :description, :address, :opening_hours,
                                  :website_url, :latitude, :longitude )
  end
end
