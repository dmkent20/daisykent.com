class MainController < ApplicationController
  layout "website"

  def home
    @posts = Post.all
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
