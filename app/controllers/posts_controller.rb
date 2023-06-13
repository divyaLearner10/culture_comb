class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @city = City.find(params[:city_id])
    @posts = @city.posts
  end

  def show
  end

  def new
    @city = City.find(params[:city_id])
    @post = Post.new
  end

  def create
    @city = City.find(params[:city_id])

    @post = Post.new(post_params)
    @post.city = @city
    @post.user = current_user
    @post.save!

    redirect_to city_posts_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :website_url)
  end
end
