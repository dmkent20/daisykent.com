module MainHelper

  def post_sorter(selected)
    deployed = subject_posts.select{ |post| post if post.deploy}
    posts_ordered_by_deploy_date = deployed.sort_by{|p| p.deploy_date}.reverse
    return posts_ordered_by_deploy_date
  end

  def find_by_subject(search)
    subject = Subject.find_by_name(params[:subject])
    if search
      subject_posts = subject.posts.search search
    else
      subject_posts = subject.posts
    end
    return subject_posts
  end

end
