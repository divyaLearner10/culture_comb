class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @cities = City.first(3)
  end

  # def show
  #   # current_user
  # end
end
