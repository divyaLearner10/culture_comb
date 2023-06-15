class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:new, :index, :show]

  def index
    @city = City.find(params[:city_id])
    @attractions = @city.attractions
    # map settup for attractions
    @markers = @attractions.geocoded.map do |attraction|
      {
        lat: attraction.latitude,
        lng: attraction.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { attraction: attraction }),
        marker_html: render_to_string(partial: "marker")
      }
    end
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

  def edit
    @city = City.find(params[:city_id])
    @attraction = @city.attractions.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @attraction = @city.attractions.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to city_attractions_path
    else
      render :edit
    end
  end

  def destroy
    @attraction.destroy

    redirect_to city_attractions_path(@attraction)
  end

  private

  def set_attraction
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :description, :address, :opening_hours,
                                  :website_url, :latitude, :longitude, :photo )
  end
end
