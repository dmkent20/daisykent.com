class MainController < ApplicationController
  layout "website"

  def home
    @posts = Post.all
    @post = Post.last
  end

  def about
  end

  def contact
  end

  def blog
  end

  def portfolio
  end

  def videos
  end
end
