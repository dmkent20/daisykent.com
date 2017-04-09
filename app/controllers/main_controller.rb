class MainController < ApplicationController
  layout "website"

  def home
    deployed_posts = Post.all.map{ |post| post if post.deploy }
    @posts = deployed_posts.reverse.select{ |post| !post.nil? }
    @post = Post.last
  end

  def about
  end

  def contact
  end

  def blog
    deployed_posts = Post.all.select{ |post| post if post.deploy }
    @posts = deployed_posts.reverse
  end

  def portfolio
  end

  def videos
    deployed_videos = Video.all.select{ |video| video if video.deploy}
    @videos = deployed_videos.reverse
  end

  def blogpost
    @post = Post.find(params[:id])
  end
end
