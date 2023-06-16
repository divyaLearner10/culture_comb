class FavoriteEventsController < ApplicationController
  def index
    @favorite_events = FavoriteEvent.all
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
