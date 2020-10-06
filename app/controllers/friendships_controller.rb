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
    @friendship = current_user.friend_requests(:user_id)

    
    # @friendship.confirmed_friend()
    
    #change the status of friendship to true if false

    # current_user.confirmed_friend(a)
  end

  def reject
  
  end
  
end
