class MainController < ApplicationController
  layout "website"

  def home
    deployed_posts = Post.all.select{ |post| post if post.deploy }
    @posts = deployed_posts.sort_by{|p| p.deploy_date}.reverse
    @post = Post.last
  end

  def about
  end

  def contact
  end

  def blog
    search = params[:search].present? ? params[:search] : nil
    if params[:subject]
      selected = self.find_by_subject(search)
      posts_ordered_by_deploy_date = self.post_sorter(selected)
    else
      if search
        deployed_posts = Post.search search, where: { deploy: true }
      else
        deployed_posts = Post.all
      end
      selected_posts = deployed_posts.select{ |post| post if post.deploy}
      posts_ordered_by_deploy_date = selected_posts.sort_by{|p| p.deploy_date}.reverse
    end
    @posts = posts_ordered_by_deploy_date.paginate(page: params[:page], :per_page => 9)
  end

  def portfolio
  end

  def vlog
    if params[:subject]
      subject = Subject.find_by_name(params[:subject])
      subject_videos = subject.videos.select{ |video| video if video.deploy}
      subject_videos_sorted = subject_videos.sort_by{|v| v.deploy_date}.reverse
      videos_ordered_by_deploy_date = subject_videos_sorted
    else
      deployed_videos = Video.all.select{ |video| video if video.deploy}
      videos_ordered_by_deploy_date = deployed_videos.sort_by{|v| v.deploy_date}.reverse
    end
    @videos = videos_ordered_by_deploy_date.paginate(page: params[:page], :per_page => 6)
  end

  def blogpost
    @post = Post.friendly.find(params[:id])
    set_meta_tags(
      title: @post.title,
      description: @post.content,
      keywords: @post.categories.map{ |c| c.name }.join(", "),
      canonical: "http://daisykent.com/blogpost/" + @post.friendly_id,
      author: @post.author,
      publisher: @post.publisher
    )
  end

  def find_by_subject(search)
    subject = Subject.find_by_name(params[:subject])
    if search
      subject_posts = Post.search search, where: { deploy: true, subjects: /.*(#{params[:subject]}).*/ }
      # subject_posts = subject.posts.search search
    else
      subject_posts = subject.posts
    end
    return subject_posts
  end

  def post_sorter(selected)
    deployed = selected.select{ |post| post if post.deploy}
    posts_ordered_by_deploy_date = deployed.sort_by{|p| p.deploy_date}.reverse
    return posts_ordered_by_deploy_date
  end

end
