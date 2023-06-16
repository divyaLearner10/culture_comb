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
    if params[:city_id].present?
      @city = City.find(params[:city_id])
    elsif params[:community_id].present?
      @community = Community.find(params[:community_id])
    end
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if params[:city_id].present?
      @city = City.find(params[:city_id])
      @event.city = @city
      @event.save!

      redirect_to city_events_path
    elsif params[:community_id].present?
      @community = Community.find(params[:community_id])
      @event.community = @community

      @event.save!
    end
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
                                  :phone_number, :start_time, photos: [])
  end
end
