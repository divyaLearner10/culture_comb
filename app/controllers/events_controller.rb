class EventsController < ApplicationController
  before_action :set_event, only: [:show, :destroy, :edit, :update]

  def index
    @city = City.find(params[:city_id])
    # @community = Community.find(params[:community_id])
    @events = @city.events
    # maps / alex feature
    # @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { event: event}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
  end

  def new
    @city = City.find(params[:city_id])
    # @community = Community.find(params[:community_id])
    @event = Event.new
  end

  def create
    @city = City.find(params[:city_id])
    # @community = Community.find(params[:community_id])

    @event = Event.new(event_params)
    @event.city = @city
    # @event.community = @community
    @event.user = current_user
    @event.save!

    redirect_to city_events_path
  end

  def edit
    @city = City.find(params[:city_id])
    @event = @city.events.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @event = @city.events.find(params[:id])
    if @event.update(event_params)
      redirect_to city_events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy

    redirect_to city_events_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :website_url, :date, :address,
                                  :phone_number, :start_date)
  end
end
