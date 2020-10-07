class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.new
    timeline_posts
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to posts_path, notice: 'Post was successfully created.'
    else
      timeline_posts
      render :index, alert: 'Post was not created.'
    end
  end

  private

  def get_friends_id
    @ids = []
    current_user.friends.each do |person|
      @ids << person.id
    end
      @ids << current_user.id
  end

  def timeline_posts
    @timeline_posts ||= Post.all.ordered_by_most_recent.includes(:user).where(id: get_friends_id)
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
