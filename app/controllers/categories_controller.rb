class CategoriesController < ApplicationController
  def create
    @post = Post.new
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        format.js
      else
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
