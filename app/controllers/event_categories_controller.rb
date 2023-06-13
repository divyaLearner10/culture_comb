class EventCategoriesController < ApplicationController
  def index
    @event_categories = EventCategory.all
  end

  def new
    @event = Event.find(params[:event_id])
    @category = Category.find(params[:category_id])
    @event_category = EventCategory.new
  end

  def create
    @event = Event.find(params[:event_id])
    @category = Category.find(params[:category_id])

    @event_category = EventCategory.new
    @event_category.event = @event
    @event_category.category = @category

    @event_category.save!
  end
end
