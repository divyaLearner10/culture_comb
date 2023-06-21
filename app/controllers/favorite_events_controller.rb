class FavoriteEventsController < ApplicationController
  def index
    @favorite_events = current_user.favorite_events

    @markers = @favorite_events.map do |favorite_event|
      {
        lat: favorite_event.event.latitude,
        lng: favorite_event.event.longitude,
        info_window_html: render_to_string(partial: "events/info_window", locals: { event: favorite_event.event}),
        marker_html: render_to_string(partial: "events/marker")
      }
    end
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
