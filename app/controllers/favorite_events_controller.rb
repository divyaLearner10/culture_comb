class FavoriteEventsController < ApplicationController
  def index
    @favorite_events = current_user.favorite_events

    @events = []
    @favorite_events.each do |favorite_event|
      @events.push(favorite_event.event)
    end

    # @markers = @events.geocoded.map do |event|
    #   raise
    #   {
    #     lat: event.latitude,
    #     lng: event.longitude,
    #     info_window_html: render_to_string(partial: "info_window", locals: { event: event}),
    #     marker_html: render_to_string(partial: "marker")
    #   }
    # end
  end

  def new
    @event = Event.find(params[:event_id])
    @favorite_event = FavoriteEvent.new
  end

  def create
    @event = Event.find(params[:event_id])

    @favorite_event = FavoriteEvent.new
    @favorite_event.event = @event
    @post.user = current_user
    @favorite_event.save!

    redirect_to favorite_events_path
  end

  def destroy
    @favorite_event = FavoriteEvent.find(params[:id])
    @favorite_event.destroy
    redirect_to favorite_events_path
  end
end
