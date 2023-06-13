class FavoriteCategoriesController < ApplicationController
  def index
    @favorite_categories = FavoriteCategory.all
  end

  def new
    @category = Category.find(params[:category_id])
    @favorite_category = FavoriteCategory.new
  end

  def create
    @category = Category.find(params[:category_id])

    @favorite_category = FavoriteCategory.new
    @favorite_category.category = @category
    @favorite_category.user = current_user
    @favorite_category.save!
  end
end
