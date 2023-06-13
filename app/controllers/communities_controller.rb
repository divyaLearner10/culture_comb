class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show]

  def index
    @city = City.find(params[:city_id])
    @communities = @city.communities
  end

  def show
  end

  def new
    @city = City.find(params[:city_id])
    @community = Community.new

  end

  def create
    @city = City.find(params[:city_id])

    @community = Community.new(community_params)
    @community.city = @city
    @community.user = current_user
    @community.save!

    redirect_to city_communities_path
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :description)
  end
end
