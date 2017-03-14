class PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    params[:post][:category_ids] ||=[]
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = 'Post successfully created'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    params[:post][:category_ids] ||=[]
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = 'Post successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully removed'

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogheader, {category_ids: []})
  end
end
