class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @video = Video.create(video_params)
    @category = Category.new
    @categories = Category.all
    params[:video][:category_ids] ||=[]
    if @video.save
      redirect_to video_path(@video)
      flash[:notice] = 'Video successfully uploaded'
    else
      flash[:notice] = 'Please enter a valid link and title'
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
    @video = Video.find(params[:id])
    @category = Category.new
    @categories = Category.all
  end

  def update
    @video = Video.find(params[:id])
    params[:video][:category_ids] ||=[]
    if @video.update(video_params)
      redirect_to video_path(@video)
      flash[:notice] = 'Video successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = 'Video successfully removed'
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :ytlink, {category_ids: []})
  end
end
