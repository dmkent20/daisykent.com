class MainController < ApplicationController
  layout "website"

  def home
    deployed_posts = Post.all.select{ |post| post if post.deploy }
    @posts = deployed_posts.reverse
    @post = Post.last
  end

  def about
  end

  def contact
  end

  def blog
    deployed_posts = Post.all.select{ |post| post if post.deploy}
    if params[:subject]
      deployed_posts = deployed_posts.select{ |post| post if params[:subject] == post.subject}
    end
    @posts = deployed_posts.reverse
  end

  def portfolio
  end

  def videos
    deployed_videos = Video.all.select{ |video| video if video.deploy}
    @videos = deployed_videos.reverse
  end

  def blogpost
    @post = Post.friendly.find(params[:id])
  end
end
