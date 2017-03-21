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
    deployed_posts = Post.all.map{ |post| post if post.deploy }
    @posts = deployed_posts.reverse.select{ |post| !post.nil? }
  end

  def portfolio
  end

  def videos
  end

  def blogpost
    @post = Post.find(params[:id])
  end
end
