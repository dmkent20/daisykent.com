class MainController < ApplicationController
  layout "website"

  def home
    @posts = Post.all.reverse
    @post = Post.last
  end

  def about
  end

  def contact
  end

  def blog
    @posts = Post.all.reverse
  end

  def portfolio
  end

  def videos
  end

  def blogpost
    @post = Post.find(params[:id])
  end
end
