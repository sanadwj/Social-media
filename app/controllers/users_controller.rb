class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
    # @mutual_friends = User.where(id: show_mutual)
  end

  # def mutual
  #   if show_mutual == nil
  #     puts "No Mutual Friend found"
  #   else
  #     @mutual_friends = User.where(id: show_mutual)
  #   end
  # end
  #
  # def show_mutual
  #   @ids = []
  #   current_user.friends.each do |person|
  #     person.friends.each do |m|
  #       @ids << m.id
  #     end
  #   end
  #   @ids.reject { |x| x == current_user.id }

  #end

end
