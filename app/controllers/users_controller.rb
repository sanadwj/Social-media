class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @mutual_friends = User.where(id: show_two_friends)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end

  private
  
  def show_mutual_friends
    @ids = []
    current_user.friends.each do |person|
      person.friends.each do |m|
        @ids << m.id
      end
    end
    @ids.reject { |x| x == current_user.id }
  end

  def show_two_friends
    show_mutual_friends.sample(2)
  end

end
