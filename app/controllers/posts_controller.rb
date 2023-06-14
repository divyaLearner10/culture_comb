class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy, :edit, :update]

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

  def edit
    @city = City.find(params[:city_id])
    @post = @city.posts.find(params[:id])
  end

  def update
    @city = City.find(params[:city_id])
    @post = @city.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to city_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to city_posts_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :website_url, :photo)
  end
end
