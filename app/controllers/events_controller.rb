class EventsController < ApplicationController
  action_before :set_event, only: [:show]

  def index
    @city = City.find(params[:city_id])
    @community = Community.find(params[:community_id])
    @events = @city.events
  end

  def show
  end

  def new
    @city = City.find(params[:city_id])
    @community = Community.find(params[:community_id])
    @event = Event.new
  end

  def create
    @city = City.find(params[:city_id])
    @community = Community.find(params[:community_id])

    @event = Event.new(event_params)
    @event.city = @city
    @event.community = @community
    @event.user = current_user
    @event.save!

    redirect_to city_path(:city_id)
  end

  private

  def set_event
    @post = Post.find(params[:id])
  end

  def event_params
    params.require(:city).permit(:name, :description, :website_url, :date, :address
                                  :latitude, :longitude, :phone_number, :start_date)
  end
end
