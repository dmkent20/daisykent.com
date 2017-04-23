class VideosController < ApplicationController
  before_action :authenticate_admin!

  def index
    @videos = Video.paginate(:page => params[:page], :per_page => 6)
  end

  def new
    @video = Video.new
    @category = Category.new
    @categories = Category.all
    @subjects = Subject.all
  end

  def create
    @video = Video.create(video_params)
    @category = Category.new
    @categories = Category.all
    @subjects = Subject.all
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
    @subjects = Subject.all
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

  def deploy
    @video = Video.find(params[:id])
    status = @video.deploy
    @video.update_attribute(:deploy, !status)
    @video.update_attribute(:deploy_date, Time.now)
    respond_to do |format|
      if @video.save
        format.js { render "_deploy.js" }
      else
        flash[:notice] = "Something went wrong :s"
      end
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
    params.require(:video).permit(:title, :description, :ytlink, {category_ids: []}, {subject_ids: []}, :deploy, :meta_description, :keywords, :canonical, :author, :publisher)
  end
end
