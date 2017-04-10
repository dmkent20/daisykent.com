class CategoriesController < ApplicationController

  def finder
    if @category.creator_id != ""
      @post = Post.friendly.find(@category.creator_id)
      @video = Video.find(@category.creator_id)
    else
      @post = Post.new
      @video = Video.new
    end
  end

  def formatter
    respond_to do |format|
      if @category.save
        if @category.created_from == "videos"
          format.js { render "_videocreate.js" }
        elsif @category.created_from == "posts"
          format.js { render "_postcreate.js" }
        end
      else
        flash[:notice] = "Something went wrong :s"
      end
    end
  end

  def create
    @categories = Category.all
    @category = Category.create(category_params)
    self.finder
    self.formatter
  end

  def destroy
    @categories = Category.all
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = 'Post successfully removed'
    respond_to do |format|
        format.js { render "_removecategory.js" }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :created_from, :creator_id)
  end
end
