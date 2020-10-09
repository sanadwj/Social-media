class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:user_id], confirmed: false)

    if @friendship.save
      redirect_to users_path, notice: 'Friendship request was sent successfully.'
    else
      redirect_to users_path, alert: @friendship.errors.full_messages.join('. ').to_s
    end
  end

  def accept
    @friendship = Friendship.find_by(friend_id: params[:friend_id], user_id: params[:user_id])
    @friendship.update confirmed: true
    redirect_to users_path, notice: 'Friendship accepted successfully'
  end

  def reject
    @friendship = Friendship.find_by(friend_id: params[:friend_id], user_id: params[:user_id])
    if @friendship == nil
      @friendship = Friendship.find_by(friend_id: params[:user_id], user_id: params[:friend_id])
    end
    @friendship.destroy
    redirect_to users_path, notice: 'Friendship was rejected'
  end
end
