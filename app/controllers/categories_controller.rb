class CategoriesController < ApplicationController

  def finder
    if @category.creator_id != ""
      if @category.created_from == "posts"
        @post = Post.friendly.find(@category.creator_id)
      else
        @video = Video.find(@category.creator_id)
      end
    else
      if @category.created_from == "posts"
        @post = Post.new
      else
        @video = Video.new
      end
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
    flash[:notice] = 'Tag successfully removed'
    respond_to do |format|
        format.js { render "_removecategory.js" }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :created_from, :creator_id)
  end
end
