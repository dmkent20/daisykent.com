class CategoriesController < ApplicationController
  def create
    @category = Category.create(category_params)
    @post = Post.new
    if @category.save
      render '/posts/new'
    else
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
