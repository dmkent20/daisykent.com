class PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @category = Category.new
    @categories = Category.all
    @subjects = Subject.all
  end

  def create
    @post = Post.create(post_params)
    @category = Category.new
    @categories = Category.all
    params[:post][:category_ids] ||=[]
    if @post.save
      redirect_to post_path(@post)
      flash[:notice] = 'Post successfully created'
    else
      flash[:notice] = 'Please enter a valid title'
      render :new
    end
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def edit
    @post = Post.friendly.find(params[:id])
    @category = Category.new
    @categories = Category.all
    @subjects = Subject.all
  end

  def update
    @post = Post.friendly.find(params[:id])
    params[:post][:category_ids] ||=[]
    if @post.update(post_params)
      redirect_to post_path(@post)
      flash[:notice] = 'Post successfully updated'
    else
      render :edit
    end
  end

  def deploy
    @post = Post.friendly.find(params[:id])
    status = @post.deploy
    @post.update_attribute(:deploy, !status)
    respond_to do |format|
      if @post.save
        format.js { render "_deploy.js" }
      else
        flash[:notice] = "Something went wrong :s"
      end
    end
  end

  def destroy
    @post = Post.friendly.find(params[:id])
    @post.destroy
    flash[:notice] = 'Post successfully removed'

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :subject, :content, :blogheader, {category_ids: []}, {subject_ids: []}, :deploy, :meta_description, :keywords, :canonical, :author, :publisher)
  end
end
