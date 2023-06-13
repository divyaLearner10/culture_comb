class AttractionsController < ApplicationController
  action_before :set_attraction, only: [:show]

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

    @attraction = Attraction.new(attractio_params)
    @attraction.city = @city
    @attraction.save!

    redirect_to city_path(:city_id)
  end

  def show
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:city).permit(:name, :description, :address, :opening_hours,
                                  :website_url, :latitude, :longitude )
  end
end
