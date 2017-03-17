class CategoriesController < ApplicationController
  def create
    @post = Post.new
    @video = Video.new
    @categories = Category.all
    @category = Category.create(category_params)
    respond_to do |format|
      if @category.save
        if @category.created_from == "videos"
          format.js { render "_videocreate.js" }
        elsif @category.created_from == "posts"
          format.js { render "_postcreate.js" }
        end
        format.html { flash[:notice] = "#{@category.name} created" }
      else
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :created_from)
  end
end
